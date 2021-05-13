package com.bkc.admin.board.term.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.dao.TermEmailDAO;
import com.bkc.admin.board.term.vo.TermEmailVO;

@Service
public class TermEmailServiceImpl implements TermEmailService {
	
	@Autowired
	private TermEmailDAO termEmailDao;
	
	//유저 이메일약관 게시글 조회
	@Override
	public TermEmailVO getTermEmailList() {
		return termEmailDao.getTermEmailList();
	}

	//관리자 이메일약관 게시글 조회
	@Override
	public TermEmailVO getTermEmailList(TermEmailVO termEmail) {		
		return termEmailDao.getTermEmailList(termEmail);
	}

	//관리자 이메일약관 게시글 수정
	@Override
	public void updateTermEmail(TermEmailVO termEmail) {
		termEmailDao.updateTermEmail(termEmail);
	}

}
