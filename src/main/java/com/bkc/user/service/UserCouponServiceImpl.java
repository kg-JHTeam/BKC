package com.bkc.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.UserCouponDAO;
import com.bkc.user.vo.CouponVO;

@Service
public class UserCouponServiceImpl implements UserCouponService {

	@Autowired
	private UserCouponDAO couponDao;
	
	@Override
	public List<CouponVO> getCouponListById(String userid) {
		return couponDao.getCouponListById(userid);
	}

	@Override
	public List<CouponVO> getCouponList() {
		return couponDao.getCouponList();
	}
}
