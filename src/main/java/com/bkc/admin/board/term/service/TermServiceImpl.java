package com.bkc.admin.board.term.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.dao.TermDAO;
import com.bkc.admin.board.term.vo.TermVO;

@Service
public class TermServiceImpl implements TermService{
	
	@Autowired
	private TermDAO termDao;
	
	//유저 이용약관 게시글 조회
	@Override
	public TermVO getTermList() {
		return termDao.getTermList();
	}

	//관리자 이용약관 게시글 조회
	@Override
	public TermVO getTermList(TermVO term) {
		return termDao.getTermList(term);
	}
	
	// 관리자 이용약관 게시글 수정
	@Override
	public void updateTerm(TermVO term) {
		termDao.updateTerm(term);
	}
}
