package com.bkc.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserCouponVO;

@Repository
public interface UserCouponDAO {

	public List<UserCouponVO> getUserCouponList();

	public List<UserCouponVO> getUserHavingCouponDetail(String userid);

	public int deleteUserCoupon(int coupon_seq);

	public int insertUserCoupon(UserCouponVO usercoupon);

	public UserCouponVO getPrice(int coupon_seq);

	public UserCouponVO getUserCouponBySeq(int coupon_seq);

	public void useUserCoupon(int coupon_seq);

	public List<UserCouponVO> getCountUserCouponNotUsed(String userid);
	
}
