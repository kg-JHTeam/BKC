package com.bkc.menuInform.vo;

public class ProductVO {
	private int product_serial;
	private String type_serial;
	private String product_name;
	private String path;
	private String description;
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
	public String getpath() {
		return path;
	}
	public void setImg_path(String path) {
		this.path = path;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType_serial() {
		return type_serial;
	}
	public void setType_serial(String type_serial) {
		this.type_serial = type_serial;
	}
	
	@Override
	public String toString() {
		return "SideMenuVO [product_serial=" + product_serial + ",  type_serial=" + type_serial
				+ ", product_name=" + product_name + ", path=" + path + ", description=" + description + "]";
	}
	
}
