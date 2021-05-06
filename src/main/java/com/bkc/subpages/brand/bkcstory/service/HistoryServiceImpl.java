package com.bkc.subpages.brand.bkcstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.subpages.brand.bkcstory.dao.HistoryDAO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

@Service
public class HistoryServiceImpl implements HistoryService{
	
	@Autowired
	private HistoryDAO dao;
	
	@Override
	@Transactional
	public List<HistoryVO> HistoryList(HistoryVO historyVO){
		return dao.HistoryList(historyVO);
	}
	
	@Override
	@Transactional
	public HistoryVO getHistory(int seq) {
		return dao.getHistory(seq);
	}
	
	@Override
	@Transactional
	public int updateHistory(HistoryVO historyVO) {
		return dao.updateHistory(historyVO);
	}
	
	@Override
	@Transactional
	public int deleteHistory(int seq) {
		return dao.deleteHistory(seq);
	}
}
