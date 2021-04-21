package com.bkc.admin.board.term.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.dao.TermEmailDAO;
import com.bkc.admin.board.term.vo.TermEmailVO;

@Service
public class TermEmailServiceImpl implements TermEmailService {
	@Autowired
	private TermEmailDAO termEmailDao;
	
	@Override
	public TermEmailVO getTermEmailList() {
		return termEmailDao.getTermEmailList();
	}

}
