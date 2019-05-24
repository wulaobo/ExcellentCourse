package com.cuit.service;

import java.util.List;

import com.cuit.domain.Answer;

public interface AnswerService {

	//新增回复
	Boolean addAnswer(Answer answer);

	//获取留言回复数
	int replyNum(int id);

	//查询回复
	List<Answer> findAll();

	//删除回复
	boolean delete(int id);

	//根据id查询回复
	Answer selectAnswerById(int id);

	//改变回复状态
	boolean change(Answer answer);

}
