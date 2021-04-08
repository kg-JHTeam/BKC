package com.bkc.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//login 처리
	@RequestMapping("/login")
	public String doLogin( 
			@RequestParam(value="error", required=false) String error,
			@RequestParam(value="logout", required=false) String logout,
			Model model) {
		
		if(error !=null) {
			model.addAttribute("errorMsg", "유효하지 않은 회원 입니다.");
		}
		if(logout !=null) {
			model.addAttribute("logoutMsg", "로그아웃 되었습니다.");
		}
		
		//로그인시 - 비밀번호 암호화
		
		logger.info("로그인 실행 : "+model.toString());
		return "delivery/login";
	}
}

