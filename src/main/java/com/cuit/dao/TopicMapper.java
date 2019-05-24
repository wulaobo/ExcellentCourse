package com.cuit.dao;

import java.util.List;

import com.cuit.domain.Answer;
import com.cuit.domain.Topic;

public interface TopicMapper {
	Boolean addTopic(Topic topic);
	
	List<Topic> findAllByName(String edituser);
	
	boolean delete(int id);
	
	Topic selectTopicById(int id);
	
	boolean editTopic(Topic topic);
	
	List<Topic> findAll();
	
	List<Topic> findAll2();
	
	List<Topic> selectTopicAnswerById(int id);
	
	boolean change(Topic topic);
}
