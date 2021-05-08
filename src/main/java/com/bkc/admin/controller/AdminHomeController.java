package com.bkc.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.delivery.service.MyLocationService;
import com.bkc.delivery.service.OrderDetailService;
import com.bkc.delivery.service.OrderService;
import com.bkc.delivery.vo.OrderVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
public class AdminHomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;

	@Autowired
	private MyLocationService mylocaService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;
	
	@RequestMapping(value = "/admin.ad", method = RequestMethod.GET)
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping(value = "/goAdminPage.ad", method = RequestMethod.GET)
	public String goAdminPage(Model model) {
		
		//User리스트
		List<UserVO> users = userService.getUserList();
		model.addAttribute("users", users);
		
		//회원가입한 인원 수
		int userCount =  users.size();
		model.addAttribute("userCount", userCount);
		
		//총 판매금액 - 주문완료 된 orderlist중에서
		int totalSales = orderService.getTotalSales();
		model.addAttribute("totalSales", totalSales);
		
		//Best Store - 가장 매출이 높은 매장
		List<OrderVO> sumSalesByStores = orderService.getTotalSalesFromStore();
		String bestStore = sumSalesByStores.get(0).getStore_name();
		model.addAttribute("bestStore", bestStore);
		
		//가장 많이 팔린 메뉴 

		
		
		return "admin/dist/index";
	}
}
