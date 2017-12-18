package com.bear.cakeonline.entity;

import javax.persistence.*;

@Entity
@Table(name="caketype")
public class CakeType {
	
	private int id;
	private String name;
	
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
}
