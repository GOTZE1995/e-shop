package com.bear.cakeonline.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.bear.cakeonline.entity.Admin;

@Repository
public class AdminDaoImpl {
	
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Admin> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Admin");
		return q.list();
	}
	
	public void saveAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(admin);
		tx.commit();
	}
	
	public void deleteAdmin(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql = "delete from Admin where id=?";
		Query q = session.createQuery(hql);
		q.setParameter(0,id);
		int ret = q.executeUpdate();
		tx.commit();
	}
	
	public void updateAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql="update Admin set adminName=?,password=?,realName=? where id=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, admin.getAdminName());
		q.setParameter(1, admin.getPassword());
		q.setParameter(2,admin.getRealName());
		q.setParameter(3,admin.getId());
		int ret=q.executeUpdate();
		tx.commit();
	}
}
