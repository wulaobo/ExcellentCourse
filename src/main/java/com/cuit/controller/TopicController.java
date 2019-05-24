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

import com.cuit.domain.Topic;
import com.cuit.service.AnswerService;
import com.cuit.service.TopicService;
import com.cuit.util.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class TopicController {
	@Resource
	TopicService ts;
	@Resource
	AnswerService as;
	
	/**
	 * 主题创建
	 * @param topic
	 * @param req
	 * @param edituser
	 * @return
	 */
	@RequestMapping("/addTopic")
	public String addTopic(@PathParam("edituser") String edituser,
			Topic topic,HttpServletRequest req){
			System.out.println("==调用了主题创建=="+edituser);
			String dateString = DateUtil.getNowTime();
			topic.setEdituser(edituser);
			topic.setPubtime(dateString);
			if(ts.addTopic(topic)){
				req.setAttribute("msg", "添加主题成功");
				return "ok";
			}else{
				req.setAttribute("msg", "添加主题失败");
				return "error";
			}
	}
	
	/**
	 * 根据用户名查询所有主题
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("selectAllTopic")
	public String selectAllTopic(@PathParam("edituser") String edituser,
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		System.out.println("==调用了查询=="+edituser);
		PageHelper.startPage(pn, 5);
		List<Topic> topic = ts.findAllByName(edituser);
		PageInfo pageTopic = new PageInfo(topic);
		req.setAttribute("topicList", pageTopic);  
		return "frontPage/topicList";
	}
	
	/**
	 * 查询所有主题
	 * @param edituser
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("selectAllTopic2")
	public String selectAllTopic2(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			System.out.println("==调用了查询==");
			PageHelper.startPage(pn, 3);
			List<Topic> topics = ts.findAll();
			PageInfo pageTopics = new PageInfo(topics);
			req.setAttribute("topicLists", pageTopics);  
			return "frontPage/messageList";
		}else{
			return "unauthorized";
		}
	}
	
	/**
	 * 后台查询
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("selectAllTopic3")
	public String selectAllTopic3(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			System.out.println("==后台调用了查询==");
			PageHelper.startPage(pn, 5);
			List<Topic> topics = ts.findAll2();
			PageInfo pageTopics = new PageInfo(topics);
			req.setAttribute("topicLists", pageTopics);  
			return "admin/bbs/allTopic";
		}else{
			return "unauthorized";
		}
	}
	
	/**
	 * 通过id查询主题
	 * @param id
	 * @param req
	 * @return
	 */
	@RequestMapping("selectTopicById")
	public String selectTopicById(@PathParam("id") int id,HttpServletRequest req){
		System.out.println("调用了id查询"+id);
		Topic topic = ts.selectTopicById(id);
		req.setAttribute("topic", topic);
		return "frontPage/edittopic";
	}
	
	/*@RequestMapping("selectTopicById2")
	public String selectTopicById2(@PathParam("id") int id,HttpServletRequest req){
		System.out.println("留言板调用了id查询"+id);
		Topic topic2 = ts.selectTopicById(id);
		req.setAttribute("topic2", topic2);
		return "frontPage/detail";
	}*/
	
	/**
	 * 编辑主题
	 * @param id
	 * @param topic
	 * @param req
	 * @return
	 */
	@RequestMapping("editTopic")
	public String editTopic(@PathParam("id") int id,Topic topic,HttpServletRequest req){
		System.out.println("====调用更新===="+topic.getTitle()+topic.getId());
		topic.setId(id);
		if(ts.editTopic(topic)){
			req.setAttribute("msg", "修改主题成功");
			return "ok";
		}else{
			return null;
		}
	}
	/**
	 *删除主题 通过id
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteTopic")
	public String deleteTopic(@PathParam("id") int id){
		System.out.println("====删除帖子==="+id);
		if(ts.delete(id)){
			return "ok";
		}else{
			return "error";
		}
	}
	
	/**
	 * 通过id查询主题和回复信息
	 */
	@RequestMapping("selectTopicAnswerById")
	public String selectTopicAnswerById(@PathParam("id") int id,HttpServletRequest req){
		System.out.println("留言板调用了id查询"+id);
		Subject subject=SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			int replyNum = as.replyNum(id);
			req.setAttribute("replyNum", replyNum);
			
			Topic list = ts.selectTopicById(id);
			req.setAttribute("list", list);
			
			List<Topic> lists = ts.selectTopicAnswerById(id);
			req.setAttribute("lists", lists);
			return "frontPage/detail";
		}else{
			return "unauthorized";
		}
	}
	
	/**
	 * 切换主题状态
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateState")
	public String updateState(@PathParam("id") int id){
		Topic topic = ts.selectTopicById(id);
		System.out.println("====执行了主题状态切换==="+topic.getState());
		if(topic.getState()==0){
			topic.setState(1);
		}else{
			topic.setState(0);
		}
		if(ts.change(topic)){
			return "redirect:/selectAllTopic3";
		}else{
			return "error";
		}
	}
}
