package com.bkc.admin.board.term.service;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.vo.TermPrivacyVO;

@Service
public interface TermPrivacyService {
	
	//개인정보 취급 방침 리스트 조회
	public TermPrivacyVO getTermPrivacyList();
}
