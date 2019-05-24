package com.cuit.service;

import java.util.List;

import com.cuit.domain.News;

public interface NewsService {
	//增加新闻
	void writeNews(News news);
	
	//查找全部新闻
	List<News> selectAllNews();
	
	//删除文章
	boolean deleteNewsById(Integer id);

	//根据id查找
	News findById(int id);

	//更新文章
	boolean updateNews(News news);

	//通过id查询
	List<News> selectNewsById(Integer id);

	//通过标题关键字查询
	List<News> selectByTitle(String title);
}
