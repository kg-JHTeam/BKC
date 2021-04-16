package com.bkc.admin.board.banner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.banner.service.BannerService;
import com.bkc.admin.board.banner.vo.BannerVO;

@Controller
public class BannerController {

	@Autowired
	private BannerService bannerService;

	// 배너 리스트 출력.
	@RequestMapping(value = "/admin/bannerlist.ad", method = RequestMethod.GET)
	public String showBannerList(Model model) {
		List<BannerVO> banners =  bannerService.getBannerList();
		
		/*
		for(int i=0; i<banners.size(); i++) {
			BannerVO banner = banners.get(i);
			System.out.println(banner.toString());
		}*/
		
		model.addAttribute("banners", banners);
		return "admin/subpages/banner/bannerlist";
	}
	
}
