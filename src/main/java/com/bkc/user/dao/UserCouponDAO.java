package com.bkc.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserCouponVO;

@Repository
public interface UserCouponDAO {

	public List<UserCouponVO> getUserCouponList();
	
}
