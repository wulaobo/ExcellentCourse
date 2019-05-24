package com.cuit.service;

import java.util.List;

import com.cuit.domain.Source;

public interface SourceService {

	//新增资料
	boolean addSource(Source source);

	//查询所有资料
	List<Source> findAll();

	//根据id 查询资料
    Source findSourceById(Integer id);

    //根据id删除资料
    void deleteSourceById(Integer id);

}
