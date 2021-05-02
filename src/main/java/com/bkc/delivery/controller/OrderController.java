package com.bkc.delivery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.delivery.service.CautionService;
import com.bkc.delivery.service.DvProductService;
import com.bkc.delivery.service.MyLocationService;
import com.bkc.delivery.vo.MyLocationVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.user.service.CouponService;
import com.bkc.user.service.UserCouponService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.CartVO;
import com.bkc.user.vo.UserCouponVO;
import com.bkc.user.vo.UserVO;

@Controller
@RequestMapping(value = "/delivery", method = RequestMethod.GET)
public class OrderController {
	@Autowired
	private BusinessInformationService biService;

	@Autowired
	private UserService userService;

	@Autowired
	private CautionService cService;

	@Autowired
	private DvProductService pService;

	@Autowired
	private CouponService couponService;

	@Autowired
	private UserCouponService usercouponService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MyLocationService mylocaService;

	// 주문페이지로 이동함.
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String goOrder(Model model, HttpSession session) {

		// 실제로 주문 할 수 있는 페이지
		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());
		model.addAttribute("user", user);

		// 카트 보내기
		CartVO cart = (CartVO) session.getAttribute("cart");
		model.addAttribute("cart", cart);

		// 회원이 가지고 있는 쿠폰 보내주기
		List<UserCouponVO> usercoupons = usercouponService.getUserHavingCouponDetail(user.getUserid());
		model.addAttribute("usercoupons", usercoupons);
		
		//지정 배달지
		MyLocationVO location = mylocaService.getLocaOne(user.getUserid());
		model.addAttribute("location", location);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "delivery/order";
	}

	// 주문페이지로 이동함.
	@RequestMapping(value = "/ordercomplete.do", method = RequestMethod.GET)
	public String goOrdercomplete(Model model) {
		System.out.println("주문완료 페이지 이동");

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/ordercomplete";
	}

	// 0원짜리 결제
	@RequestMapping(value = "ordersuccess.do", method = RequestMethod.POST)
	public String goAjaxOrdercomplete(Model model, HttpSession session) {

		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());
		model.addAttribute("user", user);

		// 카트 보내기
		CartVO cart = (CartVO) session.getAttribute("cart");
		model.addAttribute("cart", cart);

		// orderList
		// 카트를 보내면, 그게 결제할 것

		// 매장 주소
		// 자기 주소

		// 리턴값

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "delivery/ordercomplete";
	}
}
