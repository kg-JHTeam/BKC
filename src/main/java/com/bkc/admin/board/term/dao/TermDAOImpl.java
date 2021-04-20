package com.bkc.admin.board.term.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.term.vo.TermVO;

@Repository
public class TermDAOImpl implements TermDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public TermVO getTermList() {
		return sqlSession.selectOne("getTermList");
	}

}
