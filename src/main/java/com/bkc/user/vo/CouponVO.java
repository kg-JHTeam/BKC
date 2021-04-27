package com.bkc.user.vo;

import java.util.Date;

public class CouponVO {
	private String coupon_number;
	private Date startDate;
	private String coupon_serial;
	private String userid;
	
	public String getCoupon_number() {
		return coupon_number;
	}
	
	public void setCoupon_number(String coupon_number) {
		this.coupon_number = coupon_number;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
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
	@Override
	public String toString() {
		return "CouponVO [coupon_number=" + coupon_number + ", startDate=" + startDate + ", coupon_serial="
				+ coupon_serial + ", userid=" + userid + "]";
	}
	
}
