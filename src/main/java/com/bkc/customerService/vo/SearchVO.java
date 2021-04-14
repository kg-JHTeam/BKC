package com.bkc.customerService.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
public class SearchVO {
	
	private String searchText;
	private int pageNum = 0;
	
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
}
