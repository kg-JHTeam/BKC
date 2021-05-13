package com.bkc.youtube.vo;

import java.sql.Date;

public class YoutubeVO {
	private int img_seq;
	private Boolean use_status;
	private String content;
	private String title;
	private String path;
	private String date;
	private String thumbnail;

	public int getImg_seq() {
		return img_seq;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}

	public Boolean getUse_status() {
		return use_status;
	}

	public void setUse_status(Boolean use_status) {
		this.use_status = use_status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "YoutubeVO [img_seq=" + img_seq + ", use_status=" + use_status + ", content=" + content + ", title="
				+ title + ", path=" + path + ", date=" + date + ", thumbnail=" + thumbnail + "]";
	}

}
