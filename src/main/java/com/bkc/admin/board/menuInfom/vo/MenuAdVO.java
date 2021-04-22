package com.bkc.admin.board.menuInfom.vo;

public class MenuAdVO {
	private String type_serial;
	private String product_name;
	private String path;
	private String description;
	private int price;
	private int status;
	private int use_status;
	private int product_status;
	private int delivery_enable;
	private int weight;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUse_status() {
		return use_status;
	}
	public void setUse_status(int use_status) {
		this.use_status = use_status;
	}
	public int getProduct_status() {
		return product_status;
	}
	public void setProduct_status(int product_status) {
		this.product_status = product_status;
	}
	public int getDelivery_enable() {
		return delivery_enable;
	}
	public void setDelivery_enable(int delivery_enable) {
		this.delivery_enable = delivery_enable;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "MenuAdVO [type_serial=" + type_serial + ", product_name=" + product_name + ", path=" + path
				+ ", description=" + description + ", price=" + price + ", status=" + status + ", use_status="
				+ use_status + ", product_status=" + product_status + ", delivery_enable=" + delivery_enable
				+ ", weight=" + weight + "]";
	}
	
}