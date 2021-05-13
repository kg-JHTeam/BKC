package com.bkc.user.vo;

import java.util.Date;

public class CouponVO {
	private String coupon_serial;
	private String coupon_category;
	private int price;
	private String coupon_title;
	
	public String getCoupon_serial() {
		return coupon_serial;
	}
	public void setCoupon_serial(String coupon_serial) {
		this.coupon_serial = coupon_serial;
	}
	public String getCoupon_category() {
		return coupon_category;
	}
	public void setCoupon_category(String coupon_category) {
		this.coupon_category = coupon_category;
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
	@Override
	public String toString() {
		return "CouponVO [coupon_serial=" + coupon_serial + ", coupon_category=" + coupon_category + ", price=" + price
				+ ", coupon_title=" + coupon_title + "]";
	}
	
	
}
