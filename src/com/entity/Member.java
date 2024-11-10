package com.entity;

import java.util.*;

public class Member {
	private int id;
	private String uname;
	private String upass;
	private String tname;
	private String filename;
	private String tel;
	private String email;
	private String content;
	private String lev;
	private int integral;
	private double yue;
	private String savetime;
	private String delstatus;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIntegral() {
		return integral;
	}
	public void setIntegral(int integral) {
		this.integral = integral;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	
	
	
	public String getLev() {
		return lev;
	}
	public void setLev(String lev) {
		this.lev = lev;
	}
	
	public double getYue() {
		return yue;
	}
	public void setYue(double yue) {
		this.yue = yue;
	}
	@Override
	public String toString() {
		return "Member [content=" + content + ", delstatus=" + delstatus
				+ ", email=" + email + ", filename=" + filename + ", id=" + id
				+ ", integral=" + integral + ", lev=" + lev + ", savetime="
				+ savetime + ", tel=" + tel + ", tname=" + tname + ", uname="
				+ uname + ", upass=" + upass + "]";
	}
	
	
	
}
