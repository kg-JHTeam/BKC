package com.bkc.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.CouponDAO;
import com.bkc.user.vo.CouponVO;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO couponDao;
	
	//등록된 쿠폰 출력 
	@Override
	public List<CouponVO> getCouponList() {
		return couponDao.getCouponList();
	}
}
