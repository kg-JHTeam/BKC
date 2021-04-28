package com.bkc.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.UserCouponDAO;
import com.bkc.user.vo.UserCouponVO;

@Service
public class UserCouponserviceImpl implements UserCouponService {
	
	@Autowired
	private UserCouponDAO usercouponDao;
	
	@Override
	public List<UserCouponVO> getUserCouponList() {
		return usercouponDao.getUserCouponList();
	}

}
