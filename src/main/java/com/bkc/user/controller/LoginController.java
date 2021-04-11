package com.bkc.user.controller;


import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.user.service.UserServiceImpl;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//@Autowired
	//private LoginServiceImpl loginService;
	
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
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(principal.toString());
		
		logger.info("로그인 실행 : "+model.toString());
		
		//loginService에서 로그인시 암호화 
		//loginService.login();
		
		return "delivery/login";
	}
	
	//회원가입 페이지로 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("회원가입 페이지 이동");
		return "delivery/join";
	}
}

