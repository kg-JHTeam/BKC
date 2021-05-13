package com.bkc.admin.board.term.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermPrivacyVO;

@Repository
public class TermPrivacyDAOImpl implements TermPrivacyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//개인정보 취급 방침 리스트 조회
	@Override
	public TermPrivacyVO getTermPrivacyList() {
		return sqlSession.selectOne("getTermPrivacyList");
	}

	//관리자 개인정보 취급 방침 게시글 조회
	@Override
	public TermPrivacyVO getTermPrivacyList(TermPrivacyVO termPrivacy) {
		return sqlSession.selectOne("getTermPrivacyList", termPrivacy);
	}

	//관리자 개인정보 취급 방침 게시글 수정
	@Override
	public void updateTermPrivacy(TermPrivacyVO termPrivacy) {
		sqlSession.insert("updateTermPrivacy", termPrivacy);
	}

}
