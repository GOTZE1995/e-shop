package com.bear.cakeonline.cake.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bear.cakeonline.cake.dao.CakeDaoImpl;
import com.bear.cakeonline.entity.Cake;

@Service
public class CakeServiceImpl {

	@Resource
	private CakeDaoImpl cakeDaoImpl;
	
	@Transactional(readOnly=true)
	public List<Cake> listCake(int page,String value,String price1,String price2){
		String hql1 = "from Cake";
		if(value != null && !"".equals(value)) {
			hql1 = hql1 + " where name like '%" + value + "%' or description like '%" + value + "%'";
		}
		if(price1 != null && price2 != null && !"".equals(price1) && !"".equals(price2)) {
			if(hql1.equals("from Cake")) {
				hql1 = hql1 + " where discountprice between " + price1 + " and " + price2;
			}else {
				hql1 = hql1 + " and discountprice between " + price1 + " and " + price2;
			}
		}
		String hql2 = "select count(*)" + hql1;
		return this.cakeDaoImpl.findCake(hql1,hql2,page);
	}
	
	public Cake single(int id) {
		return this.cakeDaoImpl.single(id);
	}
	
	public void saveCake(Cake cake) {
		this.cakeDaoImpl.saveCake(cake);
	}
	
	public void deleteCake(int id) {
		this.cakeDaoImpl.deleteCake(id);
	}
	
	public void updateCake(Cake cake) {
		this.cakeDaoImpl.updateCake(cake);
	}
}
