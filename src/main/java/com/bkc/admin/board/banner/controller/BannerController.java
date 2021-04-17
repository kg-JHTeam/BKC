package com.bkc.admin.board.banner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		System.out.println("seq : " + seq);
		System.out.println("banner : " + banner.toString());

		model.addAttribute("banner", banner);

		return "admin/subpages/banner/bannerContent";
	}

	// 배너 사용 | 미사용 변경
	@RequestMapping(value = "/admin/changeStatusBanner.ad", method = RequestMethod.GET)
	public String changeStatusBanner(Model model, @RequestParam("img_seq") int img_seq){
			if(bannerService.changeStatus(img_seq)==1) {
				System.out.println("변경완료");
			} else {
				System.out.println("변경실패 ");
			}
		return "redirect:/admin/bannerlist.ad";
	}
	
	//배너 삭제
	// /admin/deleteBanner.ad?img_seq="+id";
	@RequestMapping(value = "/admin/deleteBanner.ad", method = RequestMethod.GET)
	public String deleteBanner(Model model, @RequestParam("img_seq") int img_seq){
		
		//DB에서 삭제
		if(bannerService.deleteBanner(img_seq)==1) {
			System.out.println("변경완료");
		} else {
			System.out.println("변경실패 ");
		}
		
		//AWS에서 삭제 
		return "redirect:/admin/bannerlist.ad";
	}
}
