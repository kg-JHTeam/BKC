package com.bkc.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.pay.service.KakaoService;

@Controller
public class KakaoPayController {

	@Autowired
	private KakaoService kakaoservice;

	@GetMapping("pay/kakaopay.do")
	public void kakaoPayGet() {

	}

	@PostMapping("pay/kakaopay.do")
	public String kakaoPay() {
		System.out.println("kakaoPay post............................................");

		return "redirect:" + kakaoservice.kakaoPayReady();

	}

	@GetMapping("pay/kakaoPaySuccess.do")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("kakaoPaySuccess get............................................");
		System.out.println("kakaoPaySuccess pg_token : " + pg_token);

		model.addAttribute("info", kakaoservice.kakaoPayInfo(pg_token));

	}

}
