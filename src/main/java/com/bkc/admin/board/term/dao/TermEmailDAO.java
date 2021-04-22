package com.bkc.admin.board.term.dao;

import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermEmailVO;

@Repository
public interface TermEmailDAO {
	
	// 이메일약관 리스트 조회 
	public TermEmailVO getTermEmailList();
}
