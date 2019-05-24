package com.cuit.service;

import java.util.List;

import com.cuit.domain.Answer;
import com.cuit.domain.Topic;

public interface TopicService {

	//新增主题
	Boolean addTopic(Topic topic);

	//通过用户名查询起对应发表的主题
	List<Topic> findAllByName(String edituser);
	
	//删除主题
	boolean delete(int id);

	//通过id查询主题
	Topic selectTopicById(int id);

	//修改主题
	boolean editTopic(Topic topic);

	//查询所有 主题
	List<Topic> findAll();
	
	//通过id查询主题和回复信息
	List<Topic> selectTopicAnswerById(int id);

	//切换主题状态
	boolean change(Topic topic);

	//后台查询主题
	List<Topic> findAll2();

}
