package com.bkc.admin.board.term.service;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.vo.TermEmailVO;

@Service
public interface TermEmailService {

	//이메일 약관 리스트 조회
	public TermEmailVO getTermEmailList();
}
