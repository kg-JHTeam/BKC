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

	@Override
	public int couponUpload(CouponVO vo) {
		return sqlSession.insert("couponUpload",vo);
	}

	@Override
	public CouponVO getCouponBySerial(String coupon_serial) {
		return sqlSession.selectOne("getCouponBySerial", coupon_serial);
	}

	@Override
	public int couponUpdate(CouponVO vo) {
		return sqlSession.insert("couponUpdate",vo);
	}

	@Override
	public int couponDelete(String coupon_serial) {
		return sqlSession.insert("couponDelete", coupon_serial);
	}

	@Override
	public CouponVO getCouponByTitle(String coupon_title) {
		return sqlSession.selectOne("getCouponByTitle", coupon_title);
	}

}
