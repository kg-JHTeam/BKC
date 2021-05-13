package com.bkc.subpages.brand.bkcstory.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

@Repository
public class HistoryDAOImpl implements HistoryDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HistoryVO> HistoryList(HistoryVO historyVO){
		return sqlSession.selectList("HistoryList", historyVO);
	}
	
	@Override
	public HistoryVO getHistory(int seq) {
		return sqlSession.selectOne("getHistory", seq);
	}
	
	@Override
	public int updateHistory(HistoryVO historyVO) {
		return sqlSession.insert("updateHistory", historyVO);
	}
	
	@Override
	public int deleteHistory(int seq) {
		return sqlSession.insert("deleteHistory", seq);
	}
}
