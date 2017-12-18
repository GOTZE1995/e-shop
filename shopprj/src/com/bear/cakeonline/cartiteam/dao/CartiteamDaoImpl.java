package com.bear.cakeonline.cartiteam.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.bear.cakeonline.entity.Cartiteam;

@Repository
public class CartiteamDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public Cartiteam findOne(int id){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Cartiteam where id=" + id);
		return (Cartiteam)q.uniqueResult();
	}
	
	public List<Cartiteam> findAll(String cartid){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Cartiteam where cartid=" + cartid);
		return q.list();
	}
	
	public void saveCartiteam(Cartiteam cartiteam) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(cartiteam);
		tx.commit();
	}
	
	public void deleteCartiteam(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql = "delete from Cartiteam where id=?";
		Query q = session.createQuery(hql);
		q.setParameter(0,id);
		int ret = q.executeUpdate();
		tx.commit();
	}

	public void updateCartiteam(Cartiteam cartiteam) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql="update Cartiteam ct set ct.count=? where ct.id=?";
		Query q=session.createQuery(hql);
		q.setInteger(0,cartiteam.getCount());
		q.setInteger(1,cartiteam.getId());
		int ret=q.executeUpdate();
		tx.commit();
	}
}
