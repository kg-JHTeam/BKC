package com.bkc.subpages.brand.whybkc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.subpages.brand.whybkc.vo.RealchickenVO;

@Repository
public class RealchickenDAOImpl implements RealchickenDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RealchickenVO> RealchickenList(RealchickenVO realchickenVO){
		return sqlSession.selectList("RealchickenList", realchickenVO);
	}

}
