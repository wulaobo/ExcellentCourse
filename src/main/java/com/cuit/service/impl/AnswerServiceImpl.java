package com.cuit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.dao.AnswerMapper;
import com.cuit.domain.Answer;
import com.cuit.service.AnswerService;

@Service
public class AnswerServiceImpl implements AnswerService{
	@Resource
	AnswerMapper am;
	
	@Override
	public Boolean addAnswer(Answer answer) {
		return am.addAnswer(answer);
	}

	@Override
	public int replyNum(int id) {
		return am.replyNum(id);
	}

	@Override
	public List<Answer> findAll() {
		return am.findAll();
	}

	@Override
	public boolean delete(int id) {
		return am.delete(id);
	}

	@Override
	public Answer selectAnswerById(int id) {
		return am.selectAnswerById(id);
	}

	@Override
	public boolean change(Answer answer) {
		return am.change(answer);
	}

}
