package com.bkc.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.user.service.CouponService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.CouponVO;

@Controller
public class AdminUserCouponController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private CouponService couponService;

	// 관리자 페이지 쿠폰 리스트 출력.
	@RequestMapping(value = "/admin/couponlist.ad", method = RequestMethod.GET)
	public String showCouponlist(Model model) {
		System.out.println("관리자 메뉴 쿠폰 리스트 출력 ");
		//모든 쿠폰 전부 출력
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);
		return "admin/subpages/coupon/couponlist";
	}
	
	//모든 쿠폰 업로드 페이지로 이동
	@RequestMapping(value = "/admin/couponUploadpage.ad", method = RequestMethod.GET)
	public String couponUploadpage(Model model) {
		return "admin/subpages/coupon/couponUploadpage";
	}
	
	//실제 쿠폰 업로드
	@RequestMapping(value = "/admin/couponUpload.ad", method = {RequestMethod.GET, RequestMethod.POST} )
	public String couponUpload(Model model) {
		//쿠폰 업로드 로직 만들기
		return "admin/subpages/coupon/couponUploadpage";
	}
}
