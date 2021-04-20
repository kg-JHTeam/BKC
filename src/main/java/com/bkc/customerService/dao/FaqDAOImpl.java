package com.bkc.customerService.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.FaqVO;
import com.bkc.customerService.vo.NoticeVO;

@Repository
public class FaqDAOImpl implements FaqDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<FaqVO> FaqList(FaqVO faqVO) {
		return sqlSession.selectList("FaqList", faqVO);
	}

	@Override
	public int FaqTotalCnt(FaqVO faqVO) {
		return sqlSession.selectOne("getNoticeTotalCnt");
	}
	
	@Override
	public List<FaqVO> AdminFaqList(FaqVO faqVO){
		return sqlSession.selectList("AdminFaqList", faqVO);
	}
}
