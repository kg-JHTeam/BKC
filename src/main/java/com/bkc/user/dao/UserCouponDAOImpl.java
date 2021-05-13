package com.bkc.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserCouponVO;

@Repository
public class UserCouponDAOImpl implements UserCouponDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserCouponVO> getUserCouponList() {
		return sqlSession.selectList("getUserCouponList");
	}

	@Override
	public List<UserCouponVO> getUserHavingCouponDetail(String userid) {
		return sqlSession.selectList("getUserHavingCouponDetail", userid);
	}

	@Override
	public int deleteUserCoupon(int coupon_seq) {
		return sqlSession.insert("deleteUserCoupon", coupon_seq);
	}

	@Override
	public int insertUserCoupon(UserCouponVO usercoupon) {
		return sqlSession.insert("insertUserCoupon", usercoupon);
	}

	@Override
	public UserCouponVO getPrice(int coupon_seq) {
		return sqlSession.selectOne("getPrice", coupon_seq);
	}

	@Override
	public UserCouponVO getUserCouponBySeq(int coupon_seq) {
		return sqlSession.selectOne("getUserCouponBySeq", coupon_seq);
	}

	@Override
	public void useUserCoupon(int coupon_seq) {
		sqlSession.insert("useUserCoupon", coupon_seq);		
	}

	@Override
	public List<UserCouponVO> getCountUserCouponNotUsed(String userid) {
		return sqlSession.selectList("getCountUserCouponNotUsed", userid);
	}

}
