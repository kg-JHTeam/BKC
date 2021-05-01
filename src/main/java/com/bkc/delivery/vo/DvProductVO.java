package com.bkc.delivery.vo;

import org.springframework.web.multipart.MultipartFile;

public class DvProductVO {
	private int product_serial;
	private int price;
	private boolean use_status;
	private String type_serial;
	private String product_name;
	private String path;
	private String description;
	private int img_seq;

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

	public int getImg_seq() {
		return img_seq;
	}

	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}

	@Override
	public String toString() {
		return "DvProductVO [product_serial=" + product_serial + ", price=" + price + ", use_status=" + use_status
				+ ", type_serial=" + type_serial + ", product_name=" + product_name + ", path=" + path
				+ ", description=" + description + ", img_seq=" + img_seq + "]";
	}

	
}
