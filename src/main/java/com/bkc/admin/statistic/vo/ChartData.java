package com.bkc.admin.statistic.vo;

import java.util.List;

public class ChartData {
	private String x;
	private List<Long> yList;
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public List<Long> getyList() {
		return yList;
	}
	public void setyList(List<Long> yList) {
		this.yList = yList;
	}
	
	
}
