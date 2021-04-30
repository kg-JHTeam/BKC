package com.bkc.menuInform.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int product_serial;
	private int price;
	private boolean use_status;
	private String type_serial;
	private String product_name; 
	private String path;
	private String description;
	private int img_seq;
	MultipartFile menu;
	
	//cart를 위해
	private int count = 0; //갯수
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void plusOne() {
		this.count++;;
	}
	public void minusOne() {
		this.count--;;
	}
	//카트관련 메서드 끝
	public int getProduct_serial() {
		return product_serial;
	}
	public void setProduct_serial(int product_serial) {
		this.product_serial = product_serial;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isUse_status() {
		return use_status;
	}
	public void setUse_status(boolean use_status) {
		this.use_status = use_status;
	}
	public String getType_serial() {
		return type_serial;
	}
	public void setType_serial(String type_serial) {
		this.type_serial = type_serial;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public MultipartFile getMenu() {
		return menu;
	}
	public void setMenu(MultipartFile menu) {
		this.menu = menu;
	}
	
	public int getImg_seq() {
		return img_seq;
	}
	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}
	@Override
	public String toString() {
		return "ProductVO [product_serial=" + product_serial + ", price=" + price + ", use_status=" + use_status
				+ ", type_serial=" + type_serial + ", product_name=" + product_name + ", path=" + path
				+ ", description=" + description + ", img_seq=" + img_seq + ", menu=" + menu + ", count=" + count + "]";
	}

	
	
	
}