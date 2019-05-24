package com.cuit.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cuit.domain.Source;

import com.cuit.service.SourceService;
import com.cuit.util.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class SourceController {
	@Resource
	SourceService ss;
	
	/**
	 * 文件上传
	 * @param source
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/upload")  
    public String upload(Source source,MultipartFile file,HttpServletRequest request) throws IOException{  
        String path = request.getSession().getServletContext().getRealPath("upload");  
//        System.out.println("调用了文件上传==path:"+path);
        String fileName = file.getOriginalFilename();    
        File dir = new File(path,fileName); 
        String dateString = DateUtil.getNowTime();
        source.setFilename(fileName);
        source.setPubtime(dateString);
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
        //MultipartFile自带的解析方法  
        file.transferTo(dir);  
        if(ss.addSource(source)){
			return "redirect:/getAllSource";
        }else{
        	return "error";
        }
    } 
	
	/**
	 * 后台查询文件信息
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("getAllSource")
	public String getAllSource(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		PageHelper.startPage(pn, 5);
		List<Source> source = ss.findAll();
		PageInfo pageSource = new PageInfo(source);
		req.setAttribute("sourceList", pageSource);  
		return "admin/source/allSource";
	}
	
	/**
	 * 前台查询文件信息
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("getAllSource2")
	public String getAllSource2(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		System.out.println("==调用了查询==");
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			PageHelper.startPage(pn, 5);
			List<Source> source = ss.findAll();
			PageInfo pageSource = new PageInfo(source);
			req.setAttribute("sourceList", pageSource);  
			return "frontPage/allSource";
		}else{
			return "unauthorized";
		}
	}
	
	/**
	 * 文件下载功能  
     * @param request  
     * @param response  
     * @throws Exception  
     */  
    @RequestMapping("/down")  
    public void down(@PathParam("filename") String filename, HttpServletRequest request,HttpServletResponse response) throws Exception{  
        //模拟文件，myfile.txt为需要下载的文件  
    	System.out.println("==调用文件下载==filename:"+filename);
        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+filename;  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));  
        //假如以中文名下载的话  
        //String filename = "下载文件.txt";  
        //转码，免得文件名中文乱码  
        //filename = URLEncoder.encode(filename,"UTF-8");  
        //设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
        out.close();  
    }


    //根据id 删除文件
	@RequestMapping("/delete")
	public String deleteSourceById(Integer id,HttpServletRequest request) {
        Source source = ss.findSourceById(id);
        if(source!=null) {
        	String filename = source.getFilename();
        	ss.deleteSourceById(id);
			String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+filename;

			File file = new File(fileName);
			if(file.exists()){
				file.delete();
			}

		}
		return "redirect:/getAllSource";
	}

}
