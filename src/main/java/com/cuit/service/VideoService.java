package com.cuit.service;

import java.util.List;

import com.cuit.domain.FileEntity;

public interface VideoService {

	//存入上传视频信息
	void saveFile(FileEntity entity);

	//获取上传视频信息
	List<FileEntity> findAll();

	//通过id获取信息
	FileEntity findById(int id);

	void deleteVideoById(Integer id);
}
