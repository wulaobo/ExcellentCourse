package com.cuit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.dao.TopicMapper;
import com.cuit.domain.Answer;
import com.cuit.domain.Topic;
import com.cuit.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService{
	@Resource
	TopicMapper tm;
	
	@Override
	public Boolean addTopic(Topic topic) {
		return tm.addTopic(topic);
	}

	@Override
	public List<Topic> findAllByName(String edituser) {
		return tm.findAllByName(edituser);
	}

	@Override
	public boolean delete(int id) {
		return tm.delete(id);
	}

	@Override
	public Topic selectTopicById(int id) {
		return tm.selectTopicById(id);
	}

	@Override
	public boolean editTopic(Topic topic) {
		return tm.editTopic(topic);
	}

	@Override
	public List<Topic> findAll() {
		return tm.findAll();
	}
	
	@Override
	public List<Topic> findAll2() {
		return tm.findAll2();
	}

	@Override
	public List<Topic> selectTopicAnswerById(int id) {
		return tm.selectTopicAnswerById(id);
	}

	@Override
	public boolean change(Topic topic) {
		return tm.change(topic);
	}
}
