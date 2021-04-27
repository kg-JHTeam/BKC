package com.bkc.delivery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;

@Controller
@RequestMapping(value = "/delivery", method = RequestMethod.GET)
public class DeliveryController {
	
	@Autowired
	private BusinessInformationService biService;
	
	//회원 주문 페이지로 이동
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery(Model model) {
		System.out.println("delivery 페이지 이동");
		
		//푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/delivery";
	}
	
	//주문내역 페이지로 이동
	@RequestMapping(value = "/orderList.do", method = RequestMethod.GET)
	public String orderList(Model model) {
		System.out.println("회원 주문내역 페이지 이동");
		
		//푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/orderList";
	}
	
}


