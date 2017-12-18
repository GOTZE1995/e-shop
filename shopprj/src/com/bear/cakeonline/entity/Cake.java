package com.bear.cakeonline.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="cake")
public class Cake {

	private int id;
	private String name;
	private String description;
	private double price;
	private double discountprice;
	private String listimg;
	private String img1;
	private String img2;
	private String img3;
	private Date cakedate;
	private CakeType cakeType;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	} 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	} 
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDiscountprice() {
		return discountprice;
	}
	public void setDiscountprice(double discountprice) {
		this.discountprice = discountprice;
	}
	public String getListimg() {
		return listimg;
	}
	public void setListimg(String listimg) {
		this.listimg = listimg;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public Date getCakedate() {
		return cakedate;
	}
	public void setCakedate(Date cakedate) {
		this.cakedate = cakedate;
	}
	@ManyToOne(cascade=CascadeType.MERGE,fetch=FetchType.EAGER)
	@JoinColumn(name="caketypeID")
	public CakeType getCakeType() {
		return cakeType;
	}
	public void setCakeType(CakeType cakeType) {
		this.cakeType = cakeType;
	}
}
