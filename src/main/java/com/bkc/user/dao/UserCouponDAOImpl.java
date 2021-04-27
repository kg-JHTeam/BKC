package com.bkc.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.CouponVO;

@Repository
public class UserCouponDAOImpl implements UserCouponDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CouponVO> getCouponListById(String userid) {
		return sqlSession.selectList("getCouponListById", userid);
	}

	@Override
	public List<CouponVO> getCouponList() {
		return sqlSession.selectList("getCouponList");
	}

}
