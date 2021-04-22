package com.bkc.admin.board.term.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermPrivacyVO;

@Repository
public class TermPrivacyDAOImpl implements TermPrivacyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public TermPrivacyVO getTermPrivacyList() {
		return sqlSession.selectOne("getTermPrivacyList");
	}

}
