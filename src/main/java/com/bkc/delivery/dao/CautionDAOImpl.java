package com.bkc.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.CautionVO;

@Repository
public class CautionDAOImpl implements CautionDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CautionVO> CautionList(CautionVO cautionVO){
		return sqlSession.selectList("CautionList", cautionVO);
	}
	
	@Override
	public int CautionInsert(CautionVO cautionVO) {
		return sqlSession.insert("CautionInsert", cautionVO);
	}
	
	@Override
	public int CautionDelete(int seq) {
		return sqlSession.insert("CautionDelete", seq);
	}
	
	@Override
	public int CautionUpdate(CautionVO cautionVO) {
		return sqlSession.insert("CautionUpdate", cautionVO);
	}
	
	@Override
	public CautionVO getCaution(int seq) {
		return sqlSession.selectOne("getCaution", seq);
	}
}
