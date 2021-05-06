package com.bkc.admin.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		// 모든 쿠폰 전부 출력
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);
		return "admin/subpages/coupon/couponlist";
	}

	// 관리자 페이지 쿠폰 리스트 출력.
	@RequestMapping(value = "/admin/couponUserlist.ad", method = RequestMethod.GET)
	public String showCouponUserlist(Model model) {
		// 모든 유저쿠폰 전부 출력
		List<UserCouponVO> usercoupons = usercouponService.getUserCouponList();
		model.addAttribute("usercoupons", usercoupons);
		return "admin/subpages/coupon/couponUserlist";
	}

	// 관리자 페이지 쿠폰 배포 페이지로.
	@RequestMapping(value = "/admin/couponRelease.ad", method = RequestMethod.GET)
	public String showCouponRelease(Model model) {

		// 쿠폰
		List<CouponVO> coupons = couponService.getCouponList();
		model.addAttribute("coupons", coupons);

		// 회원이 가지고 있는 모든 쿠폰 리스트
		List<UserCouponVO> usercoupons = usercouponService.getUserCouponList();
		model.addAttribute("usercoupons", usercoupons);

		// 회원이고 비회원이 아닌 사람 조회시킴.
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

	// 본인이 가지고 있는 쿠폰 출력
	// userHavingCouponDetail.ad
	@RequestMapping(value = "/admin/userHavingCouponDetail.ad", method = RequestMethod.GET)
	public String showUserHavingCouponDetail(Model model, @RequestParam String userid) {
		// user가 가지고 있는 쿠폰 모두 출력
		List<UserCouponVO> usercoupons = usercouponService.getUserHavingCouponDetail(userid);

		model.addAttribute("usercoupons", usercoupons);
		model.addAttribute("userid", userid);

		return "admin/subpages/coupon/userHavingCouponDetail";
	}

	// usercoupon 삭제
	@RequestMapping(value = "/admin/deleteUserCoupon.ad", method = RequestMethod.GET)
	public String deleteUserCoupon(Model model, @RequestParam int coupon_seq, @RequestParam String userid) {

		CheckVO check = new CheckVO();
		check.setSuccess("true");

		if (usercouponService.deleteUserCoupon(coupon_seq) == 1) {
			check.setSuccess("true");
		} else {
			check.setSuccess("false");
		}
		model.addAttribute("check", check);

		return "redirect:/admin/userHavingCouponDetail.ad?userid=" + userid;
	}

	// AJAX 호출 (체크된 회원에 쿠폰 배포)
	@RequestMapping(value = "/admin/releaseCoupon.ad", method = RequestMethod.POST)
	@ResponseBody
	public Object releaseCoupon(@RequestParam(value = "userArray[]") List<String> userArray,
			@RequestParam(value = "coupon_title") String coupon_title) throws ParseException {

		System.out.println(coupon_title);
		CouponVO coupon = couponService.getCouponByTitle(coupon_title);
		UserCouponVO usercoupon = new UserCouponVO();
		usercoupon.setCoupon_serial(coupon.getCoupon_serial());


		for (String user : userArray) {
			usercoupon.setUserid(user);
			try {
				if (usercouponService.insertUserCoupon(usercoupon) == 1) {
					System.out.println(user + "에 배포 성공");
				} else {
					System.out.println(user + "에 배포 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("이미 있는 값");
			}
		}

		// 리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		// 성공했다고 처리
		retVal.put("code", "OK");
		retVal.put("message", "배포에 성공 하였습니다.");
		return retVal;
	}

	// AJAX 호출 (모든사람에게 쿠폰 배포)
	@RequestMapping(value = "/admin/allreleaseCoupon.ad", method = RequestMethod.POST)
	@ResponseBody
	public Object allreleaseCoupon(@RequestParam(value = "coupon_title") String coupon_title) {
		List<UserVO> users = userService.getUserHavingCouponList();

		CouponVO coupon = couponService.getCouponByTitle(coupon_title);
		UserCouponVO usercoupon = new UserCouponVO();
		usercoupon.setCoupon_serial(coupon.getCoupon_serial());

		for (int i = 0; i < users.size(); i++) {
			UserVO user = users.get(i);
			String userid = user.getUserid();
			usercoupon.setUserid(userid);
			try {
				if (usercouponService.insertUserCoupon(usercoupon) == 1) {
					System.out.println(userid + "에 배포 성공");
				} else {
					System.out.println(userid + "에 배포 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("이미 있는 값");
			}
		}
		
		// 리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		// 성공했다고 처리
		retVal.put("code", "OK");
		retVal.put("message", "모든 회원에 쿠폰 배포 성공 하였습니다.");
		return retVal;
	}

	// 가격가져오기
	@RequestMapping(value = "/delivery/couponPrice.do", method = RequestMethod.POST)
	@ResponseBody
	public Object getCouponPrice(@RequestParam(value = "coupon_seq") int coupon_seq) {
		UserCouponVO vo  = usercouponService.getPrice(coupon_seq);
		int price = vo.getPrice();
		String category = vo.getCoupon_category();
		
		// 리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		// 성공했다고 처리
		retVal.put("price", price);
		retVal.put("category", category);
		retVal.put("message", "모든 회원에 쿠폰 배포 성공 하였습니다.");
		return retVal;
	}
}
