package com.cuit.dao;

import java.util.List;

import com.cuit.domain.News;

public interface NewsMapper {
	
	void writeNews(News news);
	
	List<News> selectAllNews();
	
	boolean deleteNewsById(int id);
	
	News findById(int id);
	
	boolean updateNews(News news);
	
	List<News> selectNewsById(Integer id);
	
	List<News> selectByTitle(String title);
}
