package com.bkc.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.CouponVO;

@Repository
public interface CouponDAO {

	public List<CouponVO> getCouponList();
}
