package com.bkc.delivery.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.delivery.service.CautionService;
import com.bkc.delivery.service.DvProductService;
import com.bkc.delivery.service.MyLocationService;
import com.bkc.delivery.service.OrderDetailService;
import com.bkc.delivery.service.OrderService;
import com.bkc.delivery.vo.MyLocationVO;
import com.bkc.delivery.vo.OrderDetailVO;
import com.bkc.delivery.vo.OrderVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.menuInform.vo.ProductVO;
import com.bkc.pay.service.KakaoService;
import com.bkc.user.controller.UserController;
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

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private KakaoService KakaoService;

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

		// 지정 배달지
		MyLocationVO location = mylocaService.getLocaOne(user.getUserid());
		model.addAttribute("location", location);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "delivery/order";
	}

	// 주문페이지로 이동함. - post로 변경하기가 필요함.
	@RequestMapping(value = "/ordercomplete.do", method = RequestMethod.GET)
	public String goOrdercomplete(Model model, @RequestParam(value = "order_serial") int order_serial) {
		System.out.println("주문완료 페이지 이동");

		// order 정보 추가
		OrderVO order = orderService.getOrder(order_serial);
		model.addAttribute("order", order);

		// user 정보 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());
		model.addAttribute("user", user);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/ordercomplete";
	}

	/*
	 * 1. userid 2. 배달지명 *- ajax로 3. user주소 *- ajax로 4. 연락처 *- ajax로 5. 요청사항 *-
	 * ajax로 6. 카트정보 - CartVO를 세션에서 꺼내온다. -> 바로 세션삭제 7. 쿠폰사용여부 * - UsercouponVO를
	 * 받는다. Usercouponseq를 받아서 -> 쿠폰사용후 삭제해버림 8. 쿠폰가격 * - UsercouponVO를 받는다.
	 * Usercouponseq를 받아서 9. 최종결제가격 - ajax로 보냄 10. 결제수단 - ajax로
	 */

	// 결제처리는 트랜잭션 넣어줘야함.
	// 결제처리 AJAX
	@ResponseBody
	@RequestMapping(value = "/ordersuccess.do", method = RequestMethod.POST)
	public Object goAjaxOrdercomplete(@RequestParam(value = "storename") String store_name,
			@RequestParam(value = "useraddress") String address,
			@RequestParam(value = "phonenumber") String phonenumber,
			@RequestParam(value = "description") String description,
			@RequestParam(value = "payment_type") String payment_type,
			@RequestParam(value = "coupon_seq") int coupon_seq, @RequestParam(value = "total_price") int total_price,
			Model model, HttpSession session) {

		System.out.println("주문실행");
		Map<String, Object> retVal = new HashMap<String, Object>();

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;

		UserVO user = userService.getUserById(userDetails.getUsername());
		CartVO cart = (CartVO) session.getAttribute("cart");

		UserCouponVO usercoupon = usercouponService.getUserCouponBySeq(coupon_seq);

		// 1. Orderlist 테이블에 추가한다.
		// order_serial storename order_status userid
		String userid = user.getUserid();
		int order_status = 1; // default 1
		Calendar cal = Calendar.getInstance();
		Date order_date = new Date(cal.getTimeInMillis());

		OrderVO order = new OrderVO(store_name, order_status, userid, coupon_seq, payment_type, total_price, address,
				order_date);

		// orderlist에 주문 추가
		int order_serial = orderService.insertOrder(order); // order_serial
		System.out.println(order.toString() + "\n order_serial : " + order_serial);

		// 2. Order Detail 테이블에 추가한다. - 메뉴별로 나눠서 <- order_serial 을 받음
		HashMap<Integer, ProductVO> products = cart.getProducts();

		// 2.1 products key가져오기
		Iterator<Integer> iterator = products.keySet().iterator();
		List<Integer> keys = new ArrayList<Integer>();
		while (iterator.hasNext()) {
			keys.add(iterator.next());
		}

		// 2.2 상품갯수만큼 Order Detail에 저장
		int productsCount = products.size();

		for (int i = 0; i < productsCount; i++) {

			ProductVO product = products.get(keys.get(i));

			String product_name = product.getProduct_name();
			int quantity = product.getCount();
			int price = product.getPrice() * quantity;

			OrderDetailVO orderDetail = new OrderDetailVO();
			orderDetail.setProduct_name(product_name);
			orderDetail.setQuantity(quantity);
			orderDetail.setPrice(price);
			orderDetail.setOrder_serial(order_serial);

			// order list에 첫번째 메뉴에 대해서 대표상품으로 등록
			if (i == 0) {
				order.setProduct_serial(order_serial);
			}

			orderDetailService.insertOrderDetail(orderDetail);
		}
		// 카트 세션 삭제 - session.removeAttribute("cart");

		retVal.put("order_serial", order_serial); // 주문관련 정보 넣어서 보냄.
		retVal.put("message", "결제 성공");
		return retVal;
	}

	// 주문내역 페이지로 이동
	@RequestMapping(value = "/delivery/orderList.do", method = RequestMethod.GET)
	public String orderList(Model model, HttpSession session) {

		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());
		model.addAttribute("user", user);

		// 사용자가 주문한 내역을 뽑아온다.
		List<OrderVO> orders = orderService.getUserOrderList(user.getUserid());
		model.addAttribute("orders", orders);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		// 지정 배달지
		MyLocationVO location = mylocaService.getLocaOne(user.getUserid());
		model.addAttribute("location", location);

		// 카트 추가
		CartVO cart = new CartVO();
		if (session.getAttribute("cart") == null) {
		} else {
			cart = (CartVO) session.getAttribute("cart");
		}
		model.addAttribute("cart", cart);

		return "delivery/orderList";
	}

	@RequestMapping(value = "/deilvery/order.do", method = RequestMethod.GET)
	public void kakaoGet() {

	}

	@RequestMapping(value = "/deilvery/order.do", method = RequestMethod.POST)
	public String kakao() {
		System.out.println("kakaoPay post............................................");

		return "redirect:" + KakaoService.kakaoPayReady();

	}
	@RequestMapping(value = "/delivery/ordercomplete.do", method = RequestMethod.GET)
	
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("kakaoPaySuccess get............................................");
		System.out.println("kakaoPaySuccess pg_token : " + pg_token);

		model.addAttribute("info", KakaoService.kakaoPayInfo(pg_token));

	}
}
