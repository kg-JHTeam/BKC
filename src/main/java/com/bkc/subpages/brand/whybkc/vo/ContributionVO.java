package com.bkc.subpages.brand.whybkc.vo;

public class ContributionVO {
	private int seq;
	private String path;
	private String content;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	@Override
	public String toString() {
		return "ContributionVO [seq=" + seq + ", path=" + path + ", content=" + content + "]";
	}
	
	
}
