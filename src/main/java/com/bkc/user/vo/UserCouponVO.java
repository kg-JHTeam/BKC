package com.bkc.user.vo;

import java.sql.Timestamp;
import java.util.Date;

public class UserCouponVO {
	private String coupon_number;
	private Timestamp startdate;
	private String coupon_serial; //fk
	private String userid;//fk
	private int coupon_seq; //pk
	private int use_status; 
	
	private Date endDate;//여기서만
	private String coupon_title; 
	
	private int price;
	private String coupon_category;
	
	
	public int getUse_status() {
		return use_status;
	}
	public void setUse_status(int use_status) {
		this.use_status = use_status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCoupon_title() {
		return coupon_title;
	}
	public void setCoupon_title(String coupon_title) {
		this.coupon_title = coupon_title;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCoupon_number() {
		return coupon_number;
	}
	public void setCoupon_number(String coupon_number) {
		this.coupon_number = coupon_number;
	}
	public Timestamp getStartdate() {
		return startdate;
	}
	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}
	public String getCoupon_serial() {
		return coupon_serial;
	}
	public void setCoupon_serial(String coupon_serial) {
		this.coupon_serial = coupon_serial;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCoupon_seq() {
		return coupon_seq;
	}
	public void setCoupon_seq(int coupon_seq) {
		this.coupon_seq = coupon_seq;
	}
	
	@Override
	public String toString() {
		return "UserCouponVO [coupon_number=" + coupon_number + ", startdate=" + startdate + ", coupon_serial="
				+ coupon_serial + ", userid=" + userid + ", coupon_seq=" + coupon_seq + "]";
	}
	public String getCoupon_category() {
		return coupon_category;
	}
	public void setCoupon_category(String coupon_category) {
		this.coupon_category = coupon_category;
	}
	
}
