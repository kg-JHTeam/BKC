package com.bkc.customerService.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.NoticeVO;
import com.bkc.customerService.vo.SearchVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<NoticeVO> getNoticeList(SearchVO searchVO) {
		System.out.println("getNoticeList() 수행");
		return sqlSession.selectList("getNoticeList", searchVO);
	}
	
	@Override
	public NoticeVO getNotice(NoticeVO notice) {
		System.out.println("getNotice() 수행");
		return sqlSession.selectOne("getNotice", notice);

	}

	@Override
	public int getNoticeTotalCnt(NoticeVO notice) {
		System.out.println("getNoticeTotalCnt() 수행");
		return sqlSession.selectOne("getNoticeTotalCnt");
	}
	
	@Override
	public void updateHits(NoticeVO notice) {
		sqlSession.update("updateHits", notice);
		System.out.println("updateHits() 수행");
	}
}
