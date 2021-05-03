package com.bkc.delivery.vo;

import java.sql.Date;

public class OrderDetailVO {
	
	//기본 멤버변수 DB관련
	private String product_name;
	private int quantity;
	private int price;
	private int seq;			//pk
	private int order_serial;	//fk 
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getOrder_serial() {
		return order_serial;
	}
	public void setOrder_serial(int order_serial) {
		this.order_serial = order_serial;
	}
	
	@Override
	public String toString() {
		return "OrderDetailVO [product_name=" + product_name + ", quantity=" + quantity
				+ ", price=" + price + ", seq=" + seq + ", order_serial=" + order_serial + "]";
	}
	
	
}
