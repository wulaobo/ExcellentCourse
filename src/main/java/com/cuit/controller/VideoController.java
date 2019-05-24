package com.cuit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.cuit.domain.FileEntity;
import com.cuit.service.VideoService;
import com.cuit.util.FileUploadTool;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class VideoController {
	@Resource
	VideoService vs;
	
	@RequestMapping("/videoUpload")
	public ModelAndView upload(@RequestParam(value = "file", required = false) MultipartFile multipartFile, HttpServletRequest request, ModelMap map ) {
		String message = "";
		FileEntity entity =null;
		FileUploadTool fileUploadTool = new FileUploadTool();
		//JSONObject getObj = new JSONObject();  
		try {
			entity = fileUploadTool.createFile(multipartFile, request);
		if(entity != null){
			vs.saveFile(entity);
//			System.out.println(entity.getId());
			message = "上传成功";
			map.put("entity", entity);
			map.put("result", message);
		}else{
			message = "上传失败";
			map.put("result", message);
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("admin/movie/result", map);
	}
	
	@RequestMapping("getAllVideo")
	public String getAllVideo(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			PageHelper.startPage(pn, 5);
			List<FileEntity> video = vs.findAll();
			PageInfo pageVideo = new PageInfo(video);
			req.setAttribute("videoList", pageVideo);  
			return "frontPage/allVideo";
		}else{
			return "unauthorized";
		}
	}

	@RequestMapping("getAllVideo2")
	public String getAllVideo2(@RequestParam(value="pn",defaultValue="1")Integer pn,
							  HttpServletRequest req){
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			PageHelper.startPage(pn, 5);
			List<FileEntity> video = vs.findAll();
			PageInfo pageVideo = new PageInfo(video);
			req.setAttribute("videoList", pageVideo);
			return "admin/movie/allVideo";
		}else{
			return "unauthorized";
		}
	}

	@RequestMapping(value = "/play")
	public ModelAndView playVideo(@PathParam("id") int id, ModelMap model) {
		FileEntity entity = vs.findById(id);
		model.put("name",entity.getTitleOrig());
		model.put("path", entity.getPath());
		ModelAndView view = new ModelAndView("frontPage/playVideo", model);
		return view;
	}

	@RequestMapping("/deleteVideoById")
	public String deleteVideoById(Integer id,HttpServletRequest request) {

		 FileEntity video = vs.findById(id);
         if(video!=null){
         	vs.deleteVideoById(id);
		 }
         String videoName = video.getTitleAlter();
		String fileName = request.getSession().getServletContext().getRealPath("video")+"/"+videoName+".mp4";
		File file = new File(fileName);
		if(file.exists()){
			file.delete();
		}
		return "redirect:/getAllVideo2";
	}
	
	@RequestMapping("/download")
	public void download(@RequestParam("filename") String fileName,
			HttpServletRequest request, ModelMap map, HttpServletResponse response) {
		try {
			fileName = fileName.substring(fileName.lastIndexOf("/"));
			fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e2) {
			e2.printStackTrace();
		}
		// 获取上传文件目录
		String logoPathDir = "/video/";
		String fileSaveRootPath = request.getSession().getServletContext().getRealPath(logoPathDir);
		// 文件路径
		String fileDir = fileSaveRootPath + File.separator + fileName;
		File file = new File(fileDir);
		if (!file.exists()) {
			System.out.println("下载的文件不存在");
			return;
		}
		// 设置响应头，控制浏览器下载该文件
		try {
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = null;
		try {
			in = new FileInputStream(fileDir);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 创建输出流
		OutputStream out;
		try {
			out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
