package com.entity;

import java.util.*;

public class Ordermsg {
	private int id;
	private String orderno;
	private int memberid;
	private String total;
	private String fkstatus;
	private String fhstatus;
	private String shstatus;
	private String name;
	private String tel;
	private String addr;
	private String savetime;
	private Member member;

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

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getFkstatus() {
		return fkstatus;
	}

	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}

	public String getShstatus() {
		return shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getFhstatus() {
		return fhstatus;
	}

	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
	}

	@Override
	public String toString() {
		return "Ordermsg [addr=" + addr + ", fkstatus=" + fkstatus + ", id="
				+ id + ", memberid=" + memberid + ", name=" + name
				+ ", orderno=" + orderno + ", shstatus=" + shstatus
				+ ", total=" + total + "]";
	}

}
