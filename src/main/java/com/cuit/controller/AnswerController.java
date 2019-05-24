package com.cuit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cuit.domain.Answer;
import com.cuit.domain.Topic;
import com.cuit.service.AnswerService;
import com.cuit.util.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class AnswerController {
	@Resource
	AnswerService as;
	
	/**
	 * 添加回复
	 * @param answeruser
	 * @param topicId
	 * @param answer
	 * @param req
	 * @return
	 */
	@RequestMapping("/addAnswer")
	public String addAnswer(@PathParam("answeruser") String answeruser,
			@PathParam("topicId") int topicId,
			Answer answer,HttpServletRequest req){
			System.out.println("==调用了主题创建=="+answeruser+"||"+topicId);
			String dateString = DateUtil.getNowTime();
			answer.setTopicId(topicId);
			answer.setAnsweruser(answeruser);
			answer.setPubtime2(dateString);
			if(as.addAnswer(answer)){
				req.setAttribute("msg", "添加回复成功");
				return "redirect:/selectAllTopic2";
			}else{
				req.setAttribute("msg", "添加回复失败");
				return "error";
			}
	}
	
	/**
	 * 查询所有回复
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("selectAllAnswer")
	public String selectAllAnswer(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			System.out.println("==后台调用了查询==");
			PageHelper.startPage(pn, 5);
			List<Answer> answer = as.findAll();
			PageInfo pageAnswers = new PageInfo(answer);
			req.setAttribute("answerLists", pageAnswers);  
			return "admin/bbs/allAnswers";
		}else{
			return "unauthorized";
		}
	}
	
	/**
	 * 删除回复
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteAnswer")
	public String deleteAnswer(@PathParam("id") int id){
		System.out.println("====删除回复==="+id);
		if(as.delete(id)){
			return "redirect:/selectAllAnswer";
		}else{
			return "error";
		}
	}
	
	/**
	 * 更新回复状态
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateAnswerState")
	public String updateAnswerState(@PathParam("id") int id){
		Answer answer = as.selectAnswerById(id);
		System.out.println("====执行了主题状态切换==="+answer.getState2());
		if(answer.getState2()==0){
			answer.setState2(1);
		}else{
			answer.setState2(0);
		}
		if(as.change(answer)){
			return "redirect:/selectAllAnswer";
		}else{
			return "error";
		}
	}
	
}
