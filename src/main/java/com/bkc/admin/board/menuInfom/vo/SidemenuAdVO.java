package com.bkc.admin.board.menuInfom.vo;

public class SidemenuAdVO {
	private int product_serial;
	private String product_name;
	private String img_path;
	private String description;
	private int status;
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
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "SidemenuAdVO [product_serial=" + product_serial + ", product_name=" + product_name + ", img_path="
				+ img_path + ", description=" + description + ", status=" + status + "]";
	}	
	
}