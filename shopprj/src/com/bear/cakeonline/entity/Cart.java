package com.bear.cakeonline.entity;

import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="cart")
public class Cart {
	private int cartid;
	private Set<Cartiteam> cartiteam;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	@OneToMany(mappedBy="cartid",targetEntity=Cartiteam.class,
			cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public Set<Cartiteam> getCartiteam() {
		return cartiteam;
	}
	public void setCartiteam(Set<Cartiteam> cartiteam) {
		this.cartiteam = cartiteam;
	}
}
