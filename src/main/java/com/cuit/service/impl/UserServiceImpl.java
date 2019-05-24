package com.cuit.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.dao.UserMapper;
import com.cuit.domain.User;
import com.cuit.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper um;
	
	@Override
	public Set<String> getRolesByUsername(String username) {
		return um.getRolesByusername(username);
	}

	@Override
	public Set<String> getPermissionsByUsername(String username) {
		return um.getPermissionsByusername(username);
	}

	@Override
	public User getUserByUsername(String username) {
		return um.getUserByusername(username);
	}

	@Override
	public void addUser(User user) {
		um.addUser(user);
	}

	@Override
	public boolean update(User user) {
		return um.update(user);
	}
	
	@Override
	public List<User> findAll() {
		List<User> findAllList = um.findAll();
		return findAllList;
	}
	
	@Override
	public boolean delete(int id) {
		return um.delete(id);
	}

	@Override
	public boolean changer(User user) {
		return um.changer(user);
	}

	@Override
	public boolean changes(User user) {
		return um.changes(user);
	}

	@Override
	public boolean changeKey(User user) {
		return um.changeKey(user);
	}

	@Override
	public List<User> selectByName(String username) {
		return um.selectByName(username);
	}

}
