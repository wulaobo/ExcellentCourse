package com.cuit.dao;

import java.util.List;

import com.cuit.domain.Answer;
public interface AnswerMapper {
	Boolean addAnswer(Answer answer);
	
	int replyNum(int id);
	
	List<Answer> findAll();
	
	boolean delete(int id);

	Answer selectAnswerById(int id);
	
	boolean change(Answer answer);
}
