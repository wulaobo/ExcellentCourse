package com.cuit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cuit.domain.User;
import com.cuit.service.UserService;
import com.cuit.util.CryptographyUtil;

@Controller
public class 	UserController {
	
	@Resource
	UserService us;
	
	/***
	 * 登录
	 * @param username
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public String login(@PathParam("username") String username,
			@PathParam("password") String password,HttpServletRequest request){
		System.out.println("用户登录时调用:"+username+"--"+password);
		User user = us.getUserByUsername(username);

			if(user!=null) {
				if (user.getState() == 1) {
					Subject subject = SecurityUtils.getSubject();
			/*if(subject.hasRole("admin")) {
			    //有权限
			} else {
			    //无权限
			}   */
					if (subject.isAuthenticated() == false) {
						UsernamePasswordToken token = new UsernamePasswordToken(username, CryptographyUtil.md5(password, "salt"));
						try {
							subject.login(token);
							Session session = subject.getSession();
							// 输出session
							System.out.println("sessionId:" + session.getId() + "sessionHost:" + session.getHost() + "sessionTimeout:" + session.getTimeout());
							session.setAttribute("username", username);
							session.setAttribute("email", user.getEmail());
							session.setAttribute("id", user.getId());
							return "redirect:index.jsp";
						} catch (Exception e) {
							e.printStackTrace();
							request.setAttribute("user", user);
							request.setAttribute("errorMsg", "用户名或密码错误！");
							return "unauthorized";
						}
					} else {
						return "index";
					}

				} else {
					request.setAttribute("user", user);
					request.setAttribute("errorMsg", "账号未激活");
					return "unauthorized";
				}
			}
		return "unauthorized";
	}
	
	/**
	 * 注册
	 * @param username
	 * @param password
	 * @param user
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping("/register")
	public String addUser(@PathParam("username") String username,
			@PathParam("password") String password,User user,
			@PathParam("email") String email,HttpServletRequest request){
		System.out.println("用户注册调用"+user.getUsername()+user.getPassword());
		if(us.getUserByUsername(user.getUsername())==null){
			user.setUsername(username);
			user.setPassword(CryptographyUtil.md5(password,"salt"));
			user.setEmail(email);
			us.addUser(user);
			return "registSuccess";
		}else{
			request.setAttribute("errorMsg", "用户名存在，注册失败");
			return "register";
		}
	}
	
	/**
	 * 修改用户信息
	 * @param id
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping("/update")
	public String update(@PathParam("id") int id,User user,HttpServletRequest req){
		System.out.println("====用户更新掉用===="+user.getUsername()+id);
		user.setId(id);
		user.setPassword(CryptographyUtil.md5(user.getPassword(),"salt"));
		if(us.update(user)){
			Subject subject = SecurityUtils.getSubject();
			if(subject.isAuthenticated()){
				subject.logout();
			}
			System.out.println("修改成功");
			return "redirect:login.jsp";
		}else{
			req.setAttribute("errorMsg", "修改出错");
			return "update";
		}
	}	
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping("/logout")
	public String loginout(){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			subject.logout();
			System.out.println("退出登录成功");
		}
		return "redirect:index.jsp";
	}
}
