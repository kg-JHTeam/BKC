package com.bkc.delivery.vo;

public class MyLocationVO {
	
	private String addr_name;
	private int addr_seq;
	private String zipcode;
	private String addr;
	private String addr_detail;
	private String addr_extra;
	private String userid;
	private String store_name;
	
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	
	public String getAddr_name() {
		return addr_name;
	}
	public void setAddr_name(String addr_name) {
		this.addr_name = addr_name;
	}
	
	public int getAddr_seq() {
		return addr_seq;
	}
	public void setAddr_seq(int addr_seq) {
		this.addr_seq = addr_seq;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getAddr_extra() {
		return addr_extra;
	}
	public void setAddr_extra(String addr_extra) {
		this.addr_extra = addr_extra;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "MyLocationVO [addr_name=" + addr_name + ", addr_seq=" + addr_seq + ", zipcode=" + zipcode + ", addr="
				+ addr + ", addr_detail=" + addr_detail + ", addr_extra=" + addr_extra + ", userid=" + userid + "]";
	}
	

}
