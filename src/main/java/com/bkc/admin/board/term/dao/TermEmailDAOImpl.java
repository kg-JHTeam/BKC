package com.bkc.admin.board.term.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermEmailVO;

@Repository
public class TermEmailDAOImpl implements TermEmailDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// 사용자 이메일약관 게시글 조회
	@Override
	public TermEmailVO getTermEmailList() {
		return sqlSession.selectOne("getTermEmailList");
	}

	// 관리자 이메일약관 게시글 조회
	@Override
	public TermEmailVO getTermEmailList(TermEmailVO termEmail) {
		System.out.println("이메일약관 관리자 게시글 조회");
		return sqlSession.selectOne("getTermEmailList", termEmail);
	}

	// 관리자 이메일약관 게시글 수정
	@Override
	public void updateTermEmail(TermEmailVO termEmail) {
		sqlSession.insert("updateTermEmail", termEmail);
		System.out.println("이메일약관 관리자 게시글 수정 완료");
	}

}
