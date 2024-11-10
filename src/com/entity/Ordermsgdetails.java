package com.entity;

import java.util.*;

public class Ordermsgdetails {
	private int id;
	private String orderno;
	private int productid;
	private int memberid;
	private int num;
	private String  savetime;
	private String thstatus;
	private Product  product;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public String getThstatus() {
		return thstatus;
	}
	public void setThstatus(String thstatus) {
		this.thstatus = thstatus;
	}
	@Override
	public String toString() {
		return "Ordermsgdetails [id=" + id + ", memberid=" + memberid
				+ ", num=" + num + ", orderno=" + orderno + ", productid="
				+ productid + "]";
	}
	
	
	
}
