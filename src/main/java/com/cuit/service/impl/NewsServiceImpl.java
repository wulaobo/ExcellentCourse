package com.cuit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.dao.NewsMapper;
import com.cuit.domain.News;
import com.cuit.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService{

	@Resource
	NewsMapper nm;
	
	@Override
	public void writeNews(News news) {
		nm.writeNews(news);
	}

	@Override
	public List<News> selectAllNews() {
		return this.nm.selectAllNews();
	}

	@Override
	public boolean deleteNewsById(Integer id) {
		return this.nm.deleteNewsById(id);
	}

	@Override
	public News findById(int id) {
		return nm.findById(id);
	}

	@Override
	public boolean updateNews(News news) {
		return nm.updateNews(news);
	}

	@Override
	public List<News> selectNewsById(Integer id) {
		return nm.selectNewsById(id);
	}

	@Override
	public List<News> selectByTitle(String title) {
		return nm.selectByTitle(title);
	}

}
