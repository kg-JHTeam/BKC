package com.bkc.admin.board.term.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.dao.TermDAO;
import com.bkc.admin.board.term.vo.TermVO;

@Service
public class TermServiceImpl implements TermService{
	@Autowired
	private TermDAO termDao;
	
	@Override
	public TermVO getTermList() {
		return termDao.getTermList();
	}

}
