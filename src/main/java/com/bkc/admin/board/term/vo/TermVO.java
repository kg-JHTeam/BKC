package com.bkc.admin.board.term.vo;

import java.sql.Date;

public class TermVO {
	private int seq;
	private Date regdate;
	private String content01;
	private String content02;
	private String content03;
	private String content04;
	
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
	public String getContent02() {
		return content02;
	}
	public void setContent02(String content02) {
		this.content02 = content02;
	}
	public String getContent03() {
		return content03;
	}
	public void setContent03(String content03) {
		this.content03 = content03;
	}
	public String getContent04() {
		return content04;
	}
	public void setContent04(String content04) {
		this.content04 = content04;
	}
	
	@Override
	public String toString() {
		return "TermVO [seq=" + seq + ", regdate=" + regdate + ", content01=" + content01 + ", content02=" + content02
				+ ", content03=" + content03 + ", content04=" + content04 + "]";
	}
	
}
