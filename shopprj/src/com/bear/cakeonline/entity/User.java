package com.bear.cakeonline.entity;

import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="users")
public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String address;
	private Set<Order> orders;
	private Cart cart;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@OneToMany(mappedBy="user", targetEntity=Order.class, 
	        cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cartid",unique=true) 
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
