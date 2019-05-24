package com.cuit.dao;

import java.util.List;
import java.util.Set;

import com.cuit.domain.User;

public interface UserMapper {

	public Set<String> getRolesByusername(String username);
	
	public Set<String> getPermissionsByusername(String username);

	public User getUserByusername(String username);

	public void addUser(User user);

	public boolean update(User user);

	List<User> findAll(); 
	
	boolean delete(int id);  
	
	boolean changer(User user);

	boolean changes(User user); 
	
	boolean changeKey(User user); 
	
	List<User> selectByName(String username);  
}
