package com.bkc.subpages.brand.bkcstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.subpages.brand.bkcstory.dao.HistoryDAO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

@Service
public class HistoryServiceImpl implements HistoryService{
	
	@Autowired
	private HistoryDAO dao;
	
	@Override
	public List<HistoryVO> HistoryList(HistoryVO historyVO){
		return dao.HistoryList(historyVO);
	}
	
	@Override
	public HistoryVO getHistory(int seq) {
		return dao.getHistory(seq);
	}
	
	@Override
	public int updateHistory(HistoryVO historyVO) {
		return dao.updateHistory(historyVO);
	}
	
	@Override
	public int deleteHistory(int seq) {
		return dao.deleteHistory(seq);
	}
}
