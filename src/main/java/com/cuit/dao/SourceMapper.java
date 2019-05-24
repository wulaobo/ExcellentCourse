package com.cuit.dao;

import java.util.List;
import com.cuit.domain.Source;

public interface SourceMapper {
	boolean addSource(Source source);
	
	List<Source> findAll();

    Source findSourceById(Integer id);

	void deleteSourceById(Integer id);
}
