package com.bkc.subpages.brand.whybkc.vo;

public class MaterialVO {
	private int seq;
	private String path;
	private String path_;
	private String content;
	public String getPath_() {
		return path_;
	}
	public void setPath_(String path_) {
		this.path_ = path_;
	}
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
		return "MaterialVO [seq=" + seq + ", path=" + path + ", path_=" + path_ + ", content=" + content + "]";
	}
	
}
