package com.bkc.admin.board.term.service;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.vo.TermEmailVO;

@Service
public interface TermEmailService {

	//이메일 약관 리스트 조회
	public TermEmailVO getTermEmailList();

	//관리자 이메일약관 게시글 조회
	public TermEmailVO getTermEmailList(TermEmailVO termEmail);
	
	//관리자 이용약관 게시글 수정
	public void updateTermEmail(TermEmailVO termEmail);
}
