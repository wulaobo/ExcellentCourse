package com.cuit.dao;

import java.util.List;

import com.cuit.domain.FileEntity;

public interface VideoMapper {

	void saveFile(FileEntity entity);

	List<FileEntity> findAll();
	
	FileEntity findById(int id);

	void deleteVideoById(Integer id);
}
