package com.bkc.customerService.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.FaqVO;

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
	
	//ad게시판
	@Override
	public List<FaqVO> AdminFaqList(FaqVO faqVO){
		return sqlSession.selectList("AdminFaqList", faqVO);
	}
	
	@Override
	public int FaqInsert(FaqVO faqVO) {
		return sqlSession.insert("FaqInsert", faqVO);
	}
	
	@Override
	public int FaqDelete(int seq) {
		return sqlSession.insert("FaqDelete", seq);
	}
	
	@Override
	public FaqVO getFaq(int seq) {
		return sqlSession.selectOne("getFaq", seq);
	}
	
	@Override
	public int updateFaq(FaqVO faqVO) {
		return sqlSession.insert("updateFaq", faqVO);
	}
}
