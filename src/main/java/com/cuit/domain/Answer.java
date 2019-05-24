package com.cuit.domain;

public class Answer {
	private int id;
	private int state2;
	private String content;
	private String answeruser;
	private String pubtime2;
	private int topicId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getState2() {
		return state2;
	}
	public void setState2(int state2) {
		this.state2 = state2;
	}
	public String getPubtime2() {
		return pubtime2;
	}
	public void setPubtime2(String pubtime2) {
		this.pubtime2 = pubtime2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnsweruser() {
		return answeruser;
	}
	public void setAnsweruser(String answeruser) {
		this.answeruser = answeruser;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	
}
