package com.entity;

import java.util.*;

public class Backproduct {
	private int id;
	private int memberid;
	private int productid;
	private String content;
	private String shstatus;
	private String savetime;
	private int orderid;
	private Ordermsgdetails ordermsgdetails;
	private Member member;
	private Product product;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public Ordermsgdetails getOrdermsgdetails() {
		return ordermsgdetails;
	}
	public void setOrdermsgdetails(Ordermsgdetails ordermsgdetails) {
		this.ordermsgdetails = ordermsgdetails;
	}
	
	
	
}
