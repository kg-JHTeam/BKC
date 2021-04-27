package com.bkc.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.user.service.UserCouponService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.CouponVO;

@Controller
public class AdminUserCouponController {
	@Autowired
	private UserService userService;

	@Autowired
	private UserCouponService couponService;

	// 관리자 페이지 쿠폰 리스트 출력.
	@RequestMapping(value = "/admin/couponlist.ad", method = RequestMethod.GET)
	public String showUsers(Model model) {
		//모든 쿠폰 전부 출력
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);
		return "admin/subpages/coupon/couponlist";
	}
}
