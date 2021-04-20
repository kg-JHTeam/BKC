package com.bkc.admin.board.term.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.vo.TermVO;

@Service
public interface TermService {

	//이용약관 리스트 조회
	public TermVO getTermList();

}
