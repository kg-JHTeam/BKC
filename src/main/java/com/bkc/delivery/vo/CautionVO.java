package com.bkc.delivery.vo;

public class CautionVO {
	
	private int seq;
	private String content;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CautionVO [seq=" + seq + ", content=" + content + "]";
	}
}
