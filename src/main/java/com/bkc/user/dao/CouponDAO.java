package com.bkc.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.CouponVO;

@Repository
public interface CouponDAO {

	public List<CouponVO> getCouponList();

	public int couponUpload(CouponVO vo);

	public CouponVO getCouponBySerial(String coupon_serial);
			
	public int couponUpdate(CouponVO vo);

	public int couponDelete(String coupon_serial);

	public CouponVO getCouponByTitle(String coupon_title);

}
