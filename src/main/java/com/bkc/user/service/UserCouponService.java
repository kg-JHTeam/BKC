package com.bkc.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.user.vo.UserCouponVO;

@Service
public interface UserCouponService {
	
	//모든 회원이 가진 쿠폰 리스트 출력
	public List<UserCouponVO> getUserCouponList();

	//회원이 가지고 있는 쿠폰 출력
	public List<UserCouponVO> getUserHavingCouponDetail(String userid);

	//쿠폰 삭제 시키기 
	public int deleteUserCoupon(int coupon_seq);

	//쿠폰 배포 
	public int insertUserCoupon(UserCouponVO usercoupon);

}
