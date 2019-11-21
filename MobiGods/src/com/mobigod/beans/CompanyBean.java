package com.mobigod.beans;

import java.sql.Date;

public class CompanyBean {
	private String type;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	private int id;
	private int c_id;
	private int p_id;
	private String o_date;
	private Date f_date;
	private Date l_date;
	private int up_price;
	
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}
	
	public int getUp_price() {
		return up_price;
	}
	public void setUp_price(int up_price) {
		this.up_price = up_price;
	}
	
	public Date getF_date() {
		return f_date;
	}
	public Date getL_date() {
		return l_date;
	}

	private int u_id;
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	private String uname;
	private String name;
	private String p_name;
	private int price;
	private String desc;
	private int offer;
	private String mark;
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public int getOffer(){
		return offer;
	}
	public void setOffer(int offer) {
		this.offer = offer;
	}
	public int getId() {
		return id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

}
