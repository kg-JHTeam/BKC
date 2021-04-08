package com.bkc.main.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public HomeController() {
		System.out.println("HomeController 실행");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		System.out.println("start");
		
		//접속관련 로그 정보 입력
		String url = request.getRequestURL().toString();
		String clientIPaddr = request.getRemoteAddr();
		logger.info("Request URL: {}, Client IP: {}", url, clientIPaddr);
		
		return "index";
	}
}
