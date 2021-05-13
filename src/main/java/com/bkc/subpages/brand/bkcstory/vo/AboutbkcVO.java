package com.bkc.subpages.brand.bkcstory.vo;

public class AboutbkcVO {
	private int seq;
	private String title;
	private String content;
	private String path;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "BkcstoryVO [seq=" + seq + ", title=" + title + ", content=" + content + ", path=" + path + "]";
	}
	
	
}
