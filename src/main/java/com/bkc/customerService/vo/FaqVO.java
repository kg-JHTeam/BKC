package com.bkc.customerService.vo;

public class FaqVO {
	private int seq;
	private String title;
	private String contents;
	private String category;
	private int start;
	private int end;
	private int rn;
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "FaqVO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", category=" + category
				+ ", start=" + start + ", end=" + end + ", rn=" + rn + "]";
	}
	
}
