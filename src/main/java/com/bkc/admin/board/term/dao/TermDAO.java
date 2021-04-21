package com.bkc.admin.board.term.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermVO;

@Repository
public interface TermDAO {

	// 이용약관 리스트 조회 
	public TermVO getTermList();

}
