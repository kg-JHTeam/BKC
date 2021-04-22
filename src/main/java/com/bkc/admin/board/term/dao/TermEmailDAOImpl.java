package com.bkc.admin.board.term.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermEmailVO;

@Repository
public class TermEmailDAOImpl implements TermEmailDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public TermEmailVO getTermEmailList() {
		return sqlSession.selectOne("getTermEmailList");
	}

}
