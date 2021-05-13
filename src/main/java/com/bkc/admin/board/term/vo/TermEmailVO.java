package com.bkc.admin.board.term.vo;

import java.sql.Date;

public class TermEmailVO {
	//멤버변수
	private int seq;
	private Date regdate;
	private String content01;
	
	//getter,setter
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent01() {
		return content01;
	}
	public void setContent01(String content01) {
		this.content01 = content01;
	}
	
	@Override
	public String toString() {
		return "TermEmailVO [seq=" + seq + ", regdate=" + regdate + ", content01=" + content01 + "]";
	}
	
	
	

}
