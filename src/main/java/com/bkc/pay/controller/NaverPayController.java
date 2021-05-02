package com.bkc.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bkc.pay.service.NaverService;

@Controller
public class NaverPayController {
	@Autowired
	private NaverService naverservice;

	@GetMapping("pay/naverpay.do")
	public void NaverPayGet() {

	}
	@PostMapping("pay/naverpay.do")
	public String kakaoPay() {
		System.out.println("kakaoPay post............................................");

		return "redirect:" + NaverService.NaverPayReady();

	}
	

}
