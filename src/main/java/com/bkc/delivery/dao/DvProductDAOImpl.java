package com.bkc.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.DvProductVO;

@Repository
public class DvProductDAOImpl implements DvProductDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DvProductVO> getChickenMenudv() {

		return sqlSession.selectList("getChickenMenudv");
	}

	@Override
	public List<DvProductVO> getSideMenudv() {
		return sqlSession.selectList("getSideMenudv");
	}

	@Override
	public List<DvProductVO> getBeerZonedv() {
		return sqlSession.selectList("getBeerZonedv");
	}

	@Override
	public List<DvProductVO> getNewdv() {
		
		return sqlSession.selectList("getNewdv");
	}

	
}
