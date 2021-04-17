package com.bkc.admin.board.banner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkc.admin.board.banner.service.BannerService;
import com.bkc.admin.board.banner.vo.BannerVO;

@Controller
public class BannerController {

	@Autowired
	private BannerService bannerService;

	// 배너 리스트 출력.
	@RequestMapping(value = "/admin/bannerlist.ad", method = RequestMethod.GET)
	public String showBannerList(Model model) {
		List<BannerVO> banners = bannerService.getBannerList();

		/*
		 * for(int i=0; i<banners.size(); i++) { BannerVO banner = banners.get(i);
		 * System.out.println(banner.toString()); }
		 */

		model.addAttribute("banners", banners);
		return "admin/subpages/banner/bannerlist";
	}

	// 배너 상세 출력
	@RequestMapping(value = "/admin/bannerDetail.ad", method = RequestMethod.GET)
	public String showBanner(Model model, @RequestParam("seq") int seq) {
		BannerVO banner = bannerService.getBanner(seq);

		System.out.println("seq : " + seq);
		System.out.println("banner : " + banner.toString());

		model.addAttribute("banner", banner);

		return "admin/subpages/banner/bannerContent";
	}

	// 배너 수정
	@RequestMapping(value = "/admin/modifyBanner.ad", method = RequestMethod.POST)
	public String modifyBanner(Model model, @RequestParam("seq") int seq) {
		BannerVO banner = bannerService.getBanner(seq);
		
		//img_seq
		//title
		//content
		//path
		//use_status
		
		System.out.println("seq : " + seq);
		System.out.println("banner : " + banner.toString());

		model.addAttribute("banner", banner);

		return "admin/subpages/banner/bannerContent";
	}

	// 배너 사용/미사용 변경
	@RequestMapping(value = "/admin/changeStatusBanner.ad", method = RequestMethod.POST)
	@ResponseBody
	public String changeStatusBanner() {
		return "redirect:";
	}
}
