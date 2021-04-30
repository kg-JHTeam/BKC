package com.bkc.admin.board.term.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermVO;

@Repository
public class TermDAOImpl implements TermDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 사용자 이용약관 게시글 조회
	@Override
	public TermVO getTermList() {
		return sqlSession.selectOne("getTermList");
	}
	
	// 관리자 이용약관 게시글 조회
	public TermVO getTermList(TermVO term) {
		System.out.println("이용약관 관리자 게시글 조회");
		return sqlSession.selectOne("getTermList", term);
	}

	// 관리자 이용약관 게시글 수정
	@Override
	public void updateTerm(TermVO term) {
		sqlSession.insert("updateTerm", term);
		System.out.println("이용약관 관리자 게시글 수정 완료");
		
	}

}
