package com.bkc.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.user.service.CouponService;
import com.bkc.user.service.UserCouponService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.CouponVO;
import com.bkc.user.vo.UserCouponVO;
import com.bkc.user.vo.UserVO;

@Controller
public class AdminUserCouponController {

	@Autowired
	private UserService userService;

	@Autowired
	private CouponService couponService;

	@Autowired 
	private UserCouponService usercouponService;
	
	// 관리자 페이지 쿠폰 리스트 출력.
	@RequestMapping(value = "/admin/couponlist.ad", method = RequestMethod.GET)
	public String showCouponlist(Model model) {
		System.out.println("관리자 메뉴 쿠폰 리스트 출력 ");
		// 모든 쿠폰 전부 출력
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);
		return "admin/subpages/coupon/couponlist";
	}

	// 관리자 페이지 쿠폰 리스트 출력.
	@RequestMapping(value = "/admin/couponUserlist.ad", method = RequestMethod.GET)
	public String showCouponUserlist(Model model) {
		System.out.println("모든 유저 쿠폰 리스트 출력 ");
		
		// 모든 유저쿠폰 전부 출력
		List<UserCouponVO> usercoupons = usercouponService.getUserCouponList();
		model.addAttribute("usercoupons", usercoupons);
		return "admin/subpages/coupon/couponUserlist";
	}
	
	// 관리자 페이지 쿠폰 배포 페이지로.
	@RequestMapping(value = "/admin/couponRelease.ad", method = RequestMethod.GET)
	public String showCouponRelease(Model model) {
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);
		
		//회원이고 비회원이 아닌 사람 조회시킴. 
		List<UserVO> users = userService.getUserHavingCouponList();
		model.addAttribute("users", users);
		
		return "admin/subpages/coupon/couponReleasepage";
	}
	
	// 모든 쿠폰 업로드 페이지로 이동
	@RequestMapping(value = "/admin/couponUploadpage.ad", method = RequestMethod.GET)
	public String couponUploadpage(Model model) {
		return "admin/subpages/coupon/couponUploadpage";
	}

	// 실제 쿠폰 업로드
	@RequestMapping(value = "/admin/couponUpload.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponUpload(Model model, @RequestParam String coupon_category, @RequestParam String coupon_serial,
			@RequestParam String coupon_title, @RequestParam int price) {
		// 쿠폰 업로드 로직 만들기
		CouponVO vo = new CouponVO();
		vo.setCoupon_category(coupon_category);
		vo.setCoupon_serial(coupon_serial);
		vo.setCoupon_title(coupon_title);
		vo.setPrice(price);

		CheckVO check = new CheckVO();
		check.setSuccess("true");

		if (couponService.couponUpload(vo) == 1) {
			check.setSuccess("true");
		} else {
			check.setSuccess("false");
		}
		model.addAttribute("check", check);
		return "admin/subpages/coupon/couponUploadpage";
	}

	// 쿠폰 수정 페이지로 이동
	@RequestMapping(value = "/admin/couponUpdatepage.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponUpdatepage(@RequestParam String coupon_serial, Model model) {
		// 쿠폰 업로드 로직 만들기
		CouponVO coupon = couponService.getCouponBySerial(coupon_serial);
		model.addAttribute("coupon", coupon);
		return "admin/subpages/coupon/couponUpdatepage";
	}

	// 실제 쿠폰 수정 로직 진행
	@RequestMapping(value = "/admin/couponUpdate.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponUpdate(Model model, @RequestParam String coupon_category, @RequestParam String coupon_serial,
			@RequestParam String coupon_title, @RequestParam int price) {

		CouponVO vo = couponService.getCouponBySerial(coupon_serial);
		vo.setCoupon_category(coupon_category);
		vo.setCoupon_serial(coupon_serial);
		vo.setCoupon_title(coupon_title);
		vo.setPrice(price);

		CheckVO check = new CheckVO();
		check.setSuccess("true");
		
		if (couponService.couponUpdate(vo) == 1) {
			check.setSuccess("uploadtrue");
		} else {
			check.setSuccess("uploadfalse");
		}
		model.addAttribute("check", check);

		// 모든 쿠폰 전부 출력
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);

		return "admin/subpages/coupon/couponlist";
	}

	// 쿠폰 삭제
	@RequestMapping(value = "/admin/couponDelete.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponDelete(@RequestParam String coupon_serial, Model model) {

		// 쿠폰 업로드 로직 만들기
		CouponVO coupon = couponService.getCouponBySerial(coupon_serial);
		model.addAttribute("coupon", coupon);

		CheckVO check = new CheckVO();
		check.setSuccess("true");

		if (couponService.couponDelete(coupon_serial) == 1) {
			check.setSuccess("deletetrue");
		} else {
			check.setSuccess("deletefalse");
		}
		// 모든 쿠폰 전부 출력
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);
		return "admin/subpages/coupon/couponlist";
	}

}
