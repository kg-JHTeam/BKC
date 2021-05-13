package com.bkc.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.delivery.service.OrderDetailService;
import com.bkc.delivery.service.OrderService;
import com.bkc.delivery.vo.MyLocationVO;
import com.bkc.delivery.vo.OrderDetailVO;
import com.bkc.delivery.vo.OrderVO;
import com.bkc.menuInform.vo.ProductVO;
import com.bkc.user.service.CouponService;
import com.bkc.user.service.UserCouponService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.CartVO;
import com.bkc.user.vo.UserCouponVO;
import com.bkc.user.vo.UserVO;

@Controller
@RequestMapping(value = "/admin", method = RequestMethod.GET)
public class AdminOrderController {

	@Autowired
	private UserService userService;

	@Autowired
	private CouponService couponService;

	@Autowired
	private UserCouponService usercouponService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	// 주문페이지로 이동함.
	@RequestMapping(value = "/orderlist.ad", method = RequestMethod.GET)
	public String goAdminOrderlist(Model model) {
		List<OrderVO> orders = orderService.getAllOrderList();
		for (int i = 0; i < orders.size(); i++) {
			OrderVO order = orders.get(i);
			List<OrderDetailVO> orderDetails = orderDetailService
					.getOrderDetailListByOrderSerial(order.getOrder_serial());
			order.setOrderDetails(orderDetails);
		}
		model.addAttribute("orders", orders);

		return "admin/subpages/order/AdminOrderlist";
	}

	// 주문 완료 페이지로 이동함.
	@RequestMapping(value = "/orderCompleteList.ad", method = RequestMethod.GET)
	public String goAdminOrderCompleteList(Model model) {
		List<OrderVO> orders = orderService.getAllOrderListByOrderStatus(3);
		for (int i = 0; i < orders.size(); i++) {
			OrderVO order = orders.get(i);
			List<OrderDetailVO> orderDetails = orderDetailService
					.getOrderDetailListByOrderSerial(order.getOrder_serial());
			order.setOrderDetails(orderDetails);
		}
		model.addAttribute("orders", orders);
		return "admin/subpages/order/AdminOrderCompleteList";
	}

	// 주문 취소 페이지로 이동함.
	@RequestMapping(value = "/orderCancellationList.ad", method = RequestMethod.GET)
	public String goAdminOrderCancellationList(Model model) {
		List<OrderVO> orders = orderService.getAllOrderListByOrderStatus(-1);
		for (int i = 0; i < orders.size(); i++) {
			OrderVO order = orders.get(i);
			List<OrderDetailVO> orderDetails = orderDetailService
					.getOrderDetailListByOrderSerial(order.getOrder_serial());
			order.setOrderDetails(orderDetails);
		}
		model.addAttribute("orders", orders);
		return "admin/subpages/order/AdminOrderCancellationList";
	}

	// 주문 취소 페이지로 이동함.
	@RequestMapping(value = "/orderReceiptlist.ad", method = RequestMethod.GET)
	public String goAdminOrderReceiptlist(Model model) {
		List<OrderVO> orders = orderService.getAllOrderListReceipt();
		for (int i = 0; i < orders.size(); i++) {
			OrderVO order = orders.get(i);
			List<OrderDetailVO> orderDetails = orderDetailService
					.getOrderDetailListByOrderSerial(order.getOrder_serial());
			order.setOrderDetails(orderDetails);
		}
		model.addAttribute("orders", orders);
		return "admin/subpages/order/AdminOrderReceiptlist";
	}

	// 주문 상태 변경 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/changeOrderStatus.ad", method = RequestMethod.POST)
	public Object changeOrderStatuse(@RequestParam(value = "order_serial") int order_serial,
			@RequestParam(value = "order_status") int order_status, Model model) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		OrderVO order = orderService.getOrder(order_serial);
		order.setOrder_status(order_status + 1);
		orderService.updateProductSerial(order);

		// 쿠폰 사용 완료 시키기 - 배달중으로 변경시키면서, 쿠폰 사용 완료
		if (order_status == 1) {
			int couponSeq = order.getCoupon_seq();

			if (couponSeq == -1) {
			} // 쿠폰 사용안한 경우
			// 쿠폰사용한 경우
			else {
				// 쿠폰사용
				usercouponService.useUserCoupon(couponSeq);
			}
		}

		System.out.println(order.toString());
		retVal.put("order_serial", order_serial);
		return retVal;
	}

}
