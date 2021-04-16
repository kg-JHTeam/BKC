package com.bkc.main.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.banner.service.BannerService;
import com.bkc.admin.board.banner.vo.BannerVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BannerService bannerService;
	
	public HomeController() {
		System.out.println("HomeController 실행");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		
		//배너 추가
		List<BannerVO> banners =  bannerService.getBannerList();
		model.addAttribute("banners", banners);
		
		//접속관련 로그 정보 입력
		String url = request.getRequestURL().toString();
		String clientIPaddr = request.getRemoteAddr();
		logger.info("Request URL: {}, Client IP: {}", url, clientIPaddr);
		
		return "index";
	}
}
