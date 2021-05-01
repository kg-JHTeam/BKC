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
import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.youtube.service.YoutubeService;
import com.bkc.youtube.vo.YoutubeVO;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private BannerService bannerService;

	// 푸터
	@Autowired
	private BusinessInformationService biService;
	
	@Autowired
	private YoutubeService youtubeService;

	public HomeController() {
		//System.out.println("HomeController 실행");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {

		// 배너 추가
		List<BannerVO> banners = bannerService.getBannerUsedList();
		model.addAttribute("banners", banners);

		// 푸터 추가
		int seq = 1;
		BusinessInformationVO bi = biService.getBusinessInformation(seq);
		model.addAttribute("bi", bi);

		// 접속관련 로그 정보 입력
		String url = request.getRequestURL().toString();
		String clientIPaddr = request.getRemoteAddr();
		logger.info("Request URL: {}, Client IP: {}", url, clientIPaddr);
		
		// 유튜브 추가
		YoutubeVO youtube = youtubeService.getYoutube();
		model.addAttribute("youtube", youtube);
		
		return "index";
	}
}
