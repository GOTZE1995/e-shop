package com.bear.cakeonline.cartiteam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bear.cakeonline.cartiteam.dao.CartiteamDaoImpl;
import com.bear.cakeonline.entity.Cartiteam;

@Service
public class CartiteamServiceImpl {
	@Resource
	private CartiteamDaoImpl cartiteamDaoImpl;
	
	@Transactional(readOnly=true)
	public Cartiteam listOne(int id){
		return this.cartiteamDaoImpl.findOne(id);
	}
	
	@Transactional(readOnly=true)
	public List<Cartiteam> listAll(String cartid){
		return this.cartiteamDaoImpl.findAll(cartid);
	}
	
	public void saveCartiteam(Cartiteam cartiteam) {
		this.cartiteamDaoImpl.saveCartiteam(cartiteam);
	}
	
	public void deleteCartiteam(int id) {
		this.cartiteamDaoImpl.deleteCartiteam(id);
	}
	
	public void updateCartiteam(Cartiteam cartiteam) {
		this.cartiteamDaoImpl.updateCartiteam(cartiteam);
	}
}
