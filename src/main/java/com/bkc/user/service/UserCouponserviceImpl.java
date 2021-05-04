package com.bkc.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.UserCouponDAO;
import com.bkc.user.vo.CouponVO;
import com.bkc.user.vo.UserCouponVO;

@Service
public class UserCouponserviceImpl implements UserCouponService {
	
	@Autowired
	private UserCouponDAO usercouponDao;
	
	@Override
	public List<UserCouponVO> getUserCouponList() {
		return usercouponDao.getUserCouponList();
	}

	@Override
	public List<UserCouponVO> getUserHavingCouponDetail(String userid) {
		return usercouponDao.getUserHavingCouponDetail(userid);
	}

	@Override
	public int deleteUserCoupon(int coupon_seq) {
		return usercouponDao.deleteUserCoupon(coupon_seq);
	}

	@Override
	public int insertUserCoupon(UserCouponVO usercoupon) {
		return usercouponDao.insertUserCoupon(usercoupon);
	}

	@Override
	public UserCouponVO getPrice(int coupon_seq) {
		return usercouponDao.getPrice(coupon_seq);	
	}

	@Override
	public UserCouponVO getUserCouponBySeq(int coupon_seq) {
		return usercouponDao.getUserCouponBySeq(coupon_seq);	
	}

	@Override
	public void useUserCoupon(int coupon_seq) {
		usercouponDao.useUserCoupon(coupon_seq);	
	}

	@Override
	public List<UserCouponVO> getCountUserCouponNotUsed(String userid) {
		return usercouponDao.getCountUserCouponNotUsed(userid);
	}

}
