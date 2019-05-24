package com.cuit.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.cuit.domain.User;
import com.cuit.service.UserService;
import com.cuit.util.CryptographyUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class AdminController {
	@Resource
	UserService us;
	
	/**
	 * 检测是否已经登录
	 * @return
	 */
	@RequestMapping("/checkLogin")
	public String checkLogin(){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()==false){
			return "adlogin";
		}
		return "redirect:admin/home.jsp";
	}
	
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @param req
	 * @return
	 */
	@RequestMapping("/adminLogin")
	public String adminLogin(@PathParam("username") String username,
			@PathParam("password") String password,HttpServletRequest req){
		System.out.println("管理员登录时调用:"+username+"--"+password);
		User user = us.getUserByUsername(username);

		if(user!=null){
			System.out.println("state="+user.getState()+"||roleid="+user.getRoleId()+"||id"+user.getId());
			if(user.getRoleId()==2){
				return "unauthorized";
			}else if(user.getState()==1) {
				Subject subject = SecurityUtils.getSubject();
//			if(subject.isAuthenticated()==true){
				UsernamePasswordToken token = new UsernamePasswordToken(username, CryptographyUtil.md5(password,"salt"));
				try{
					subject.login(token);
					Session session = subject.getSession();
					System.out.println("sessionId:"+session.getId()+"sessionHost:"+session.getHost()+"sessionTimeout:"+session.getTimeout());
					session.setAttribute("username", username);
					session.setAttribute("id", user.getId());
					return "success";
				}catch(Exception e){
					e.printStackTrace();
					req.setAttribute("user", user);
					req.setAttribute("errorMsg", "用户名或密码错误！");
					return "adlogin";
				}

			}else{
				req.setAttribute("user",user);
				req.setAttribute("errorMsg", "账号未激活");
				return "adlogin";
			}
		}
		return "adlogin";
	}


	/**
	 * 在浏览器上输入 admin 进入管理员登陆页面
	 * @author wulaobo
	 */
	@RequestMapping("/Admin")
	public String admin() {
		return "adlogin";
	}

	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping("/adlogout")
	public String loginout(){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			subject.logout();
			System.out.println("退出登录成功");
		}
		return "redirect:index.jsp";
	}
	
	/**
	 * 查询所有用户
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("/getAllUser")
	public String getAllUser(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		PageHelper.startPage(pn, 5);
		List<User> user = us.findAll();
		PageInfo pageUser = new PageInfo(user);
		req.setAttribute("userList", pageUser);  
		return "admin/user/allUser";
	}
	
	/**
	 * 通过姓名模糊查询用户
	 * @param pn
	 * @param req
	 * @return
	 */
	@RequestMapping("/selectByName")
	public String selectByName(@PathParam("username") String username,
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest req){
		System.out.println("调用了模糊查询=="+username);
		PageHelper.startPage(pn, 5);
		List<User> user = us.selectByName(username);
		PageInfo pageUser = new PageInfo(user);
		req.setAttribute("userList", pageUser);  
		return "admin/user/allUser";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/deleteUser")
	public String deleteUser(int id){
		System.out.println("====用户删除==="+id);
		if(us.delete(id)){
			return "redirect:/getAllUser";
		}else{
			return "error";
		}
	}
	
	/**
	 * 切换用户角色
	 * @param
	 * @return
	 */
	@RequestMapping("/changeRole")
	public String changeRole(String username){
		System.out.println("====执行了用户角色切换===");
		User user = us.getUserByUsername(username);
		System.out.println("==roleId=="+user.getRoleId());
		if(user.getRoleId()==2){
			user.setRoleId(1);
		}else{
			user.setRoleId(2);
		}
		if(us.changer(user)){
			return "redirect:/getAllUser";
		}else{
			return "error";
		}
	}
	
	/**
	 * 切换用户状态
	 * @param
	 * @return
	 */
	@RequestMapping("/changeState")
	public String changeState(String username){
		User user = us.getUserByUsername(username);
		System.out.println("====执行了用户状态切换==="+user.getRoleId());
		if(user.getState()==0){
			user.setState(1);;
		}else{
			user.setState(0);;
		}
		if(us.changes(user)){
			return "redirect:/getAllUser";
		}else{
			return "error";
		}
	}
	
	/**
	 * 修改密码
	 * @param user
	 * @return
	 */
	@RequestMapping("/changeKey")
	public String changeKey(@PathParam("id") int id,User user){
		System.out.println("====用户更新掉用===="+user.getUsername()+id);
		user.setId(id);
		user.setPassword(CryptographyUtil.md5(user.getPassword(),"salt"));
		if(us.changeKey(user)){
			Subject subject = SecurityUtils.getSubject();
			if(subject.isAuthenticated()){
				subject.logout();
			}
			return "adlogin";
		}else{
			return "error";
		}
	}
	
}
