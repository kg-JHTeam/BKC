package com.bkc.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.user.vo.CouponVO;

@Service
public interface CouponService {

	//모든 쿠폰리스트 받아오기 
	public List<CouponVO> getCouponList();
}
