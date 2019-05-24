package com.cuit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.dao.VideoMapper;
import com.cuit.domain.FileEntity;
import com.cuit.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {
	@Resource
	VideoMapper vm;
	
	@Override
	public void saveFile(FileEntity entity) {
		vm.saveFile(entity);
	}

	@Override
	public List<FileEntity> findAll() {
		return vm.findAll();
	}

	@Override
	public FileEntity findById(int id) {
		return vm.findById(id);
	}

	@Override
	public void deleteVideoById(Integer id) {
		 vm.deleteVideoById(id);
	}

}
