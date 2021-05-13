package com.bkc.admin.board.term.service;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.vo.TermVO;

@Service
public interface TermService {

	//이용약관 리스트 조회
	public TermVO getTermList();
	
	//관리자 이용약관 게시글 조회
	public TermVO getTermList(TermVO term);
	
	//관리자 이용약관 게시글 수정
	public void updateTerm(TermVO term);

}
