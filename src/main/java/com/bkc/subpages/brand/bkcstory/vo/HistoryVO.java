package com.bkc.subpages.brand.bkcstory.vo;

public class HistoryVO {
	private int seq;
	private String title;
	private String content;
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
	@Override
	public String toString() {
		return "HistoryVO [seq=" + seq + ", title=" + title + ", content=" + content + "]";
	}
	
	
}
