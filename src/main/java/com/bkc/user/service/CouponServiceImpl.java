package com.bkc.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.user.dao.CouponDAO;
import com.bkc.user.vo.CouponVO;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO couponDao;
	
	//등록된 쿠폰 출력 
	@Override
	@Transactional
	public List<CouponVO> getCouponList() {
		return couponDao.getCouponList();
	}
	
	//쿠폰 업로드 
	@Override
	@Transactional
	public int couponUpload(CouponVO vo) {
		return couponDao.couponUpload(vo);
	}

	//시리얼로 쿠폰 조회 
	@Override
	@Transactional
	public CouponVO getCouponBySerial(String coupon_serial) {
		return couponDao.getCouponBySerial(coupon_serial);
	}

	//쿠폰 수정
	@Override
	@Transactional
	public int couponUpdate(CouponVO vo) {
		return couponDao.couponUpdate(vo);
	}

	//쿠폰 삭제 
	@Override
	@Transactional
	public int couponDelete(String coupon_serial) {
		return couponDao.couponDelete(coupon_serial);
	}

	@Override
	@Transactional
	public CouponVO getCouponByTitle(String coupon_title) {
		return couponDao.getCouponByTitle(coupon_title);
	}
}
