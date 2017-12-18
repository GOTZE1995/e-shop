package com.bear.cakeonline.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="orders")
public class Order {
	private int id;
	private User user;
	private Date odate;            //下单时间
	private int status;            //订单状态  0未处理   1已处理  2用户退订
	private Set<OrderDetail> orderDetails;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne(cascade=CascadeType.MERGE,fetch=FetchType.EAGER)
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@OneToMany(mappedBy="order", targetEntity=OrderDetail.class, 
	        cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
}
