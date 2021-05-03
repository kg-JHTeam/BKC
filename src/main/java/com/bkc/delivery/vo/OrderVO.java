package com.bkc.delivery.vo;

public class OrderVO {
	
	//OrderList DB 기본 매개변수
	private int order_serial;		//order_detail table
	private String store_name;		//store table
	private int order_status;
	private String userid;			//usermember table
	private int coupon_seq;			//user_coupon table
	private int total_price;
	private String payment_type;	//결제타입 
	private String address; 	//주소 
	
	//추가적인 매개변수 
	public OrderVO() {
		super();
	}

	public OrderVO(String store_name, int order_status, String userid, int coupon_seq, String payment_type, int total_price, String address) {
		this.store_name = store_name;
		this.order_status = order_status;
		this.userid = userid;
		this.coupon_seq = coupon_seq;
		this.payment_type = payment_type;
		this.total_price = total_price;
		this.address = address;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	
	public int getOrder_serial() {
		return order_serial;
	}
	public void setOrder_serial(int order_serial) {
		this.order_serial = order_serial;
	}
	
	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "OrderVO [order_serial=" + order_serial + ", store_name=" + store_name + ", order_status=" + order_status
				+ ", userid=" + userid + ", coupon_seq=" + coupon_seq + ", total_price=" + total_price
				+ ", payment_type=" + payment_type + ", address=" + address + "]";
	}
	
}
