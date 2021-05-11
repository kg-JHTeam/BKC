package com.bkc.admin.statistic.vo;

import java.sql.Date;

public class StatisticVO {
	
	private String order_date;
	private int total_price;
	private String store_name;
	private int order_serial;
	private int price;
	private String product_name;
	private int product_serial;
	private String x;
	private long y;
	private int month_total;
	private int day_total;
	private int rn;
	private String payment_type;
	
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getDay_total() {
		return day_total;
	}
	public void setDay_total(int day_total) {
		this.day_total = day_total;
	}
	public int getMonth_total() {
		return month_total;
	}
	public void setMonth_total(int month_total) {
		this.month_total = month_total;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public long getY() {
		return y;
	}
	public void setY(long y) {
		this.y = y;
	}
	

	public int getProduct_serial() {
		return product_serial;
	}
	public void setProduct_serial(int product_serial) {
		this.product_serial = product_serial;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getOrder_serial() {
		return order_serial;
	}
	public void setOrder_serial(int order_serial) {
		this.order_serial = order_serial;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
