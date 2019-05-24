package com.cuit.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cuit.dao.SourceMapper;
import com.cuit.domain.Source;
import com.cuit.service.SourceService;

@Service
public class SourceServiceImpl implements SourceService {
	@Resource
	SourceMapper sm;
	
	@Override
	public boolean addSource(Source source) {
		return sm.addSource(source);
	}

	@Override
	public List<Source> findAll() {
		return sm.findAll();
	}

	@Override
	public Source findSourceById(Integer id) {
		return sm.findSourceById(id);

	}

	@Override
	public void deleteSourceById(Integer id) {
		sm.deleteSourceById(id);
	}

}
