package com.bkc.menuInform.vo;

public class SideMenuVO {
	private int seq;
	private String menu_name;
	private String content;
	private String menu_img;

	public int getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
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

	@Override
	public String toString() {
		return "SidemenuVO [seq=" + seq + ", menu_name=" + menu_name + ", content=" + content + ", menu_img=" + menu_img
				+ "]";
	}

}
