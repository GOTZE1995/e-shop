package com.bear.cakeonline.user.dao;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.bear.cakeonline.entity.Cart;
import com.bear.cakeonline.entity.Order;
import com.bear.cakeonline.entity.OrderDetail;
import com.bear.cakeonline.entity.User;
import com.bear.cakeonline.util.Page;

@Repository
public class UserDaoImpl {
	
	@Resource
	private SessionFactory sessionFactory;
	
	public List<User> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from User");
		return q.list();
	}
	
	public List<User> bgfindAll(int page){
		Session session=this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from User");
		q.setFirstResult((page-1)*10); 
		q.setMaxResults(10);
		long t = (long)(session.createQuery("select count(*) from User").uniqueResult());
		if(t == 0)
			Page.totalpages = 0;
		else if(t%10 == 0)
			Page.totalpages = (int)t/10;
		else
			Page.totalpages = (int)t/10 + 1;
		return q.list();
	}
	
	public void saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Cart cart = new Cart();
		session.save(cart);
		user.setCart(cart);
		session.save(user);
		tx.commit();
	}
	
	public boolean deleteUser(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {  
		    tx = session.beginTransaction();  
			User user = session.load(User.class, id);
			session.delete(user);
		} catch (Exception e) {  
			 tx.rollback();
		} finally {  
		     tx.commit(); 
		     session.close();
		}  
		return true;
	}
	
	public boolean updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql="update User set password=?,phone=?,address=? where username=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, user.getPassword());
		q.setParameter(1, user.getPhone());
		q.setParameter(2,user.getAddress());
		q.setParameter(3,user.getUsername());
		int ret=q.executeUpdate();
		tx.commit();
		if(ret != 0)
			return true;
		else
			return false;
	}
}
