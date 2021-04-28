package com.bkc.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.user.vo.UserCouponVO;

@Service
public interface UserCouponService {
	
	//모든 회원이 가진 쿠폰 리스트 출력
	public List<UserCouponVO> getUserCouponList();

}
