package com.bkc.customerService.notice.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class NoticeVO {
	private int seq;
	
	private String title;
	private String contents;
	private Timestamp post_date;
	private int hits;
	private String searchText;
	private int start;
	private int end;
	
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
	
	public Timestamp getPost_date() {
		return post_date;
	}

	public void setPost_date(Timestamp post_date) {
		this.post_date = post_date;
	}

	public int getHits() {
		return hits;
	}
	
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
	
	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
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

	@Override
	public String toString() {
		return "NoticeVO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", date=" + post_date + ", hits="
				+ hits + "]";
	}
	
	
}
