package com.bkc.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.user.vo.CouponVO;

@Service
public interface CouponService {

	//모든 쿠폰리스트 받아오기 
	public List<CouponVO> getCouponList();

	//쿠폰 업로드 
	public int couponUpload(CouponVO vo);

	//시리얼로 쿠폰 가져오기 
	public CouponVO getCouponBySerial(String coupon_serial);

	//쿠폰 수정
	public int couponUpdate(CouponVO vo);

	//쿠폰 삭제
	public int couponDelete(String coupon_serial);

	//제목으로 가져오기 
	public CouponVO getCouponByTitle(String coupon_title);
	
	
}
