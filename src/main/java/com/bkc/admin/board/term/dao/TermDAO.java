package com.bkc.admin.board.term.dao;

import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermVO;

@Repository
public interface TermDAO {

	//  사용자 이용약관 리스트 조회 
	public TermVO getTermList();

	// 관리자 이용약관 리스트 조회
	public TermVO getTermList(TermVO term);

	// 관리자 이용약관 게시글 수정
	public void updateTerm(TermVO term);
}
