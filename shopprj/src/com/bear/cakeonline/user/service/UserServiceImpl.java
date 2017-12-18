package com.bear.cakeonline.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bear.cakeonline.user.dao.UserDaoImpl;
import com.bear.cakeonline.entity.User;

@Service
public class UserServiceImpl {

	@Resource
	private UserDaoImpl userDaoImpl;
	
	@Transactional(readOnly=true)
	public List<User> listAll() {
		return this.userDaoImpl.findAll();
	}
	
	@Transactional(readOnly=true)
	public List<User> bglist(int page) {
		return this.userDaoImpl.bgfindAll(page);
	}
	
	public void saveUser(User user) {
		userDaoImpl.saveUser(user);
	}
	
	public boolean deleteUser(int id) {
		if(userDaoImpl.deleteUser(id))
			return true;
		else
			return false;
	}
	
	public boolean updateUser(User user) {
		if(userDaoImpl.updateUser(user))
			return true;
		else
			return false;
	}
}
