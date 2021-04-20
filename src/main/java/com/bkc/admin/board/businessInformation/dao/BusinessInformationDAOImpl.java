package com.bkc.admin.board.businessInformation.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;

@Service
public class BusinessInformationDAOImpl implements BusinessInformationDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public BusinessInformationVO getBusinessInformation(int seq) {
		return sqlSession.selectOne("getBusinessInformation", seq);
	}

	@Override
	public int updateBusinessInformation(BusinessInformationVO vo) {
		return sqlSession.insert("updateBusinessInformation", vo);
	}

}
