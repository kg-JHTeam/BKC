package com.bkc.event.vo;

public class StoreVO {
	
	private String store_name;
	private String store_call;
	private String store_address;
	private int store_status;
	private String store_open;
	private int rn;
	private boolean event_yn;
	public String latitude;
	public String longtitude;
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}
	public boolean isEvent_yn() {
		return event_yn;
	}
	public void setEvent_yn(boolean event_yn) {
		this.event_yn = event_yn;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getStore_open() {
		return store_open;
	}
	public void setStore_open(String store_open) {
		this.store_open = store_open;
	}
	
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_call() {
		return store_call;
	}
	public void setStore_call(String store_call) {
		this.store_call = store_call;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public int getStore_status() {
		return store_status;
	}
	public void setStore_status(int store_status) {
		this.store_status = store_status;
	}
	@Override
	public String toString() {
		return "StoreVO [store_name=" + store_name + ", store_call=" + store_call + ", store_address=" + store_address
				+ ", store_status=" + store_status + ", store_open=" + store_open + ", rn=" + rn + ", event_yn="
				+ event_yn + ", latitude=" + latitude + ", longtitude=" + longtitude + "]";
	}
	

}
