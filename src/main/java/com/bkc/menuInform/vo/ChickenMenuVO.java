package com.bkc.menuInform.vo;

import org.springframework.stereotype.Repository;

public class ChickenMenuVO {
	private int seq;	
	private String menu_name;
	private String content;
	private String menu_img;
	private int chicken_type;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	public int getChicken_type() {
		return chicken_type;
	}
	public void setChicken_type(int chicken_type) {
		this.chicken_type = chicken_type;
	}
	@Override
	public String toString() {
		return "ChickenMenuVO [seq=" + seq + ", menu_name=" + menu_name + ", content=" + content + ", menu_img="
				+ menu_img + ", chicken_type=" + chicken_type + "]";
	}
}
