package com.bkc.admin.board.banner.vo;

public class BannerVO {
	private int img_seq;
	private String title;
	private String path;
	private String content;
	private Boolean use_status;
	
	public int getImg_seq() {
		return img_seq;
	}
	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Boolean getUse_status() {
		return use_status;
	}
	public void setUse_status(Boolean use_status) {
		this.use_status = use_status;
	}
	
	@Override
	public String toString() {
		return "BannerVO [img_seq=" + img_seq + ", title=" + title + ", path=" + path + ", content=" + content
				+ ", use_status=" + use_status + "]";
	}
	
}
