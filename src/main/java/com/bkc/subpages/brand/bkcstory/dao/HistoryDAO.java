package com.bkc.subpages.brand.bkcstory.dao;

import java.util.List;

import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

public interface HistoryDAO {
	
	public List<HistoryVO> HistoryList(HistoryVO historyVO);
}
