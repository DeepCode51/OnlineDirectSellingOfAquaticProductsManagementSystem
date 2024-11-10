package com.entity;

import java.util.*;

public class Category {
	private int id;
	private String name;
	private String delstatus;
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
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	@Override
	public String toString() {
		return "Category [delstatus=" + delstatus + ", id=" + id + ", name="
				+ name + "]";
	}
	
	
	
}
