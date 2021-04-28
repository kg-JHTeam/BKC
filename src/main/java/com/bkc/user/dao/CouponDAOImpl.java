package com.bkc.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.CouponVO;

@Repository
public class CouponDAOImpl implements CouponDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CouponVO> getCouponList() {
		return sqlSession.selectList("getCouponList");
	}

}
