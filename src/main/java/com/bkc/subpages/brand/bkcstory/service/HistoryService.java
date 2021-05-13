package com.bkc.subpages.brand.bkcstory.service;

import java.util.List;

import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

public interface HistoryService {
	
	public List<HistoryVO> HistoryList(HistoryVO historyVO);
	
	public HistoryVO getHistory(int seq);
	
	public int updateHistory(HistoryVO historyVO);
	
	public int deleteHistory(int seq);
}
