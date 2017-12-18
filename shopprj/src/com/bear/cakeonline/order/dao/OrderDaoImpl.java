package com.bear.cakeonline.order.dao;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.bear.cakeonline.entity.Order;
import com.bear.cakeonline.entity.OrderDetail;
import com.bear.cakeonline.util.Page;

@Repository
public class OrderDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Order> findAll(int page){
		Session session=this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Order");
		q.setFirstResult((page-1)*10); 
		q.setMaxResults(10);
		long t = (long)(session.createQuery("select count(*) from Order").uniqueResult());
		if(t == 0)
			Page.totalpages = 0;
		else if(t%10 == 0)
			Page.totalpages = (int)t/10;
		else
			Page.totalpages = (int)t/10 + 1;
		return q.list();
	}
	
	public Set<OrderDetail> findDetail(int id){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Order where id=?");
		q.setParameter(0, id);
		Order order = (Order) q.uniqueResult();
		Set<OrderDetail> list = order.getOrderDetails();
		return list;
	}
	
	public List<Order> find(int userid){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Order where userId =? and status<>2");
		q.setParameter(0, userid);
		return q.list();
	}
	
	public void saveOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(order);
		tx.commit();
	}
	
	public void saveOrderDetail(OrderDetail orderDetail) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(orderDetail);
		tx.commit();
	}
	
	public void deleteOrder(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql = "delete from Order where id=?";
		Query q = session.createQuery(hql);
		q.setParameter(0,id);
		int ret = q.executeUpdate();
		tx.commit();
	}
	
	public void deleteCart(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql = "delete from Cartiteam where id=?";
		Query q = session.createQuery(hql);
		q.setParameter(0,id);
		int ret = q.executeUpdate();
		tx.commit();
	}
	
	public void updateOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String hql="update Order set status=? where id=?";
		Query q=session.createQuery(hql);
		q.setParameter(0,order.getStatus());
		q.setParameter(1,order.getId());
		int ret=q.executeUpdate();
		tx.commit();
	}
}
