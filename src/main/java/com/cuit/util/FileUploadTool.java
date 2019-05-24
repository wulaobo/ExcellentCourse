package com.cuit.util;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.cuit.domain.FileEntity;

public class FileUploadTool {
	TransfMediaTool transfMediaTool = new TransfMediaTool();
	// 文件最大500M
	private static long upload_maxsize = 800 * 1024 * 1024;
	// 文件允许格式
	private static String[] allowFiles = { ".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".xlsx", ".gif",
			".png", ".jpg", ".jpeg", ".bmp", ".xls", ".mp4", ".flv", ".ppt", ".avi", ".mpg", ".wmv", ".3gp", ".mov",
			".asf", ".asx", ".vob", ".wmv9", ".rm", ".rmvb" };
	// 允许转码的视频格式（ffmpeg）
	private static String[] allowFLV = { ".avi", ".mpg", ".wmv", ".3gp", ".mov", ".asf", ".asx", ".vob" };
	// 允许的视频转码格式(mencoder)
	private static String[] allowAVI = { ".wmv9", ".rm", ".rmvb" };

	public FileEntity createFile(MultipartFile multipartFile, HttpServletRequest request) {
		FileEntity entity = new FileEntity();
		boolean bflag = false;
		String fileName = multipartFile.getOriginalFilename().toString();
		// 判断文件不为空
		if (multipartFile.getSize() != 0 && !multipartFile.isEmpty()) {
			bflag = true;
			// 判断文件大小
			if (multipartFile.getSize() <= upload_maxsize) {
				bflag = true;
				// 文件类型判断
				if (this.checkFileType(fileName)) {
					bflag = true;
				} else {
					bflag = false;
					System.out.println("文件类型不允许");
				}
			} else {
				bflag = false;
				System.out.println("文件大小超范围");
			}
		} else {
			bflag = false;
			System.out.println("文件为空");
		}
		if (bflag) {
			String logoPathDir = "/video/";
			String logoRealPathDir = request.getServletContext().getRealPath(logoPathDir);
			// 上传到本地磁盘
			// String logoRealPathDir = "E:/upload";
			File logoSaveFile = new File(logoRealPathDir);
			if (!logoSaveFile.exists()) {
				logoSaveFile.mkdirs();
			}
			String name = fileName.substring(0, fileName.lastIndexOf("."));
			System.out.println("文件名称：" + name);
			// 新的文件名
			String newFileName = this.getName(fileName);
			// 文件扩展名
			String fileEnd = this.getFileExt(fileName);
			// 绝对路径
			String fileNamedirs = logoRealPathDir + File.separator + newFileName + fileEnd;
			System.out.println("保存的绝对路径：" + fileNamedirs);
			File filedirs = new File(fileNamedirs);
			// 转入文件
			try {
				multipartFile.transferTo(filedirs);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 相对路径
			entity.setType(fileEnd);
			String fileDir = logoPathDir + newFileName + fileEnd;
			StringBuilder builder = new StringBuilder(fileDir);
			String finalFileDir = builder.substring(1);
			// size存储为String
			String size = this.getSize(filedirs);
			// 源文件保存路径
//			String aviPath = filedirs.getAbsolutePath();
//			if (this.checkAVIType(fileEnd)) {
//				// 设置转换为AVI格式后文件的保存路径
//				String codcAviPath = logoRealPathDir + File.separator + newFileName + ".avi";
//				// 获取配置的转换工具（mencoder.exe）的存放路径
//				String mencoderPath = request.getServletContext().getRealPath("/tools/mencoder.exe");
//				aviPath = transfMediaTool.processAVI(mencoderPath, filedirs.getAbsolutePath(), codcAviPath);
//				fileEnd = this.getFileExt(codcAviPath);
//			}
//			if (aviPath != null) {
//				// 转码Flv
//				if (this.checkMediaType(fileEnd)) {
//					try {
//						// 设置转换为flv格式后文件的保存路径
//						String codcFilePath = logoRealPathDir + File.separator + newFileName + ".flv";
//						// 获取配置的转换工具（ffmpeg.exe）的存放路径
//						String ffmpegPath = request.getServletContext().getRealPath("/tools/ffmpeg.exe");
//						transfMediaTool.processFLV(ffmpegPath, aviPath, codcFilePath);
//						fileDir = logoPathDir + newFileName + ".flv";
//						builder = new StringBuilder(fileDir);
//						finalFileDir = builder.substring(1);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//				}
				entity.setSize(size);
				entity.setPath(finalFileDir);
				entity.setTitleOrig(name);
				entity.setTitleAlter(newFileName);
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				entity.setUploadTime(timestamp);
				return entity;
			} else {
				return null;
			}


	}

	/**
	 * 文件类型判断
	 *
	 * @param fileName
	 * @return
	 */
	private boolean checkFileType(String fileName) {
		Iterator<String> type = Arrays.asList(allowFiles).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * 视频类型判断(flv)
	 *
	 * @param fileName
	 * @return
	 */
	private boolean checkMediaType(String fileEnd) {
		Iterator<String> type = Arrays.asList(allowFLV).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileEnd.equals(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 视频类型判断(AVI)
	 *
	 * @param fileName
	 * @return
	 */
	private boolean checkAVIType(String fileEnd) {
		Iterator<String> type = Arrays.asList(allowAVI).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileEnd.equals(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取文件扩展名
	 *
	 * @return string
	 */
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	/**
	 * 依据原始文件名生成新文件名
	 * 
	 * @return
	 */
	private String getName(String fileName) {
		Random random = new Random();
		return "" + random.nextInt(10000) + System.currentTimeMillis();

	}

	/**
	 * 文件大小，返回kb.mb
	 * 
	 * @return
	 */
	private String getSize(File file) {
		String size = "";
		long fileLength = file.length();
		DecimalFormat df = new DecimalFormat("#.00");
		if (fileLength < 1024) {
			size = df.format((double) fileLength) + "BT";
		} else if (fileLength < 1048576) {
			size = df.format((double) fileLength / 1024) + "KB";
		} else if (fileLength < 1073741824) {
			size = df.format((double) fileLength / 1048576) + "MB";
		} else {
			size = df.format((double) fileLength / 1073741824) + "GB";
		}

		return size;

	}

}
