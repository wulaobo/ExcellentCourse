package com.cuit.service;

import java.util.List;
import java.util.Set;

import com.cuit.domain.User;

public interface UserService {
	//增加用户
	public void addUser(User user);
	
	//根据用户名查找角色
	public Set<String> getRolesByUsername(String username);
	
	//根据用户名查找权限
	public Set<String> getPermissionsByUsername(String username);

	//根据用户名查找用户
	public User getUserByUsername(String username);

	//更新用户
	public boolean update(User user);

	//查询所有用户
	List<User> findAll();

	//删除用户
    boolean delete(int id);
    
    //改变用户角色
	boolean changer(User user);

	//改变用户状态
	boolean changes(User user);

	//修改密码
	boolean changeKey(User user);
	
	//通过用户名模糊查询
	List<User> selectByName(String username);    
	
}