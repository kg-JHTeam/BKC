package com.bkc.admin.board.menuInfom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.menuInfom.service.SidemenuAdService;
import com.bkc.admin.board.menuInfom.vo.SidemenuAdVO;



public class SidemenuAdController {
	@Autowired
	private SidemenuAdService sidemenuadService;
	
	@RequestMapping(value = "/admin/sidemenuListAd.ad", method = RequestMethod.GET)
	public String showSidemenuList(Model model) {
		List<SidemenuAdVO> sidemenus = sidemenuadService.getSidemenuAdList();
		model.addAttribute("sidemenus", sidemenus);
		return "admin/subpages/menu/sidemenuListAd";
	}

	// 메뉴상세 출력
	@RequestMapping(value = "/admin/SidemenuAdDetail.ad", method = RequestMethod.GET)
	public String showSidemenuAd(Model model, @RequestParam("product_serial") int product_serial) {
		SidemenuAdVO sidemenuad = sidemenuadService.getSidemenuAd(product_serial);
		System.out.println("product_serial : " + product_serial);
		System.out.println("sidemenuad : " + sidemenuad.toString());
		model.addAttribute("sidemenuad", sidemenuad);
		return "admin/subpages/menu/sidemenuAdContent";
	}
	// 메뉴 수정
		@RequestMapping(value = "/admin/modifySidemenu.ad", method = RequestMethod.POST)
		public String modifySidemenu(Model model, @RequestParam("product_serial") int product_serial) {
			SidemenuAdVO sidemenuad = sidemenuadService.getSidemenuAd(product_serial);
			
			System.out.println("product_serial : " + product_serial);
			System.out.println("sidemenuad : " + sidemenuad.toString());

			model.addAttribute("sidemenuad", sidemenuad);

			return "admin/subpages/menu/sidemenuAdContent";
		}

		// 판매상태 변경
		@RequestMapping(value = "/admin/changeStatusSidemenu.ad", method = RequestMethod.GET)
		public String changeStatusSidemenu(Model model, @RequestParam("product_serial") int product_serial){
				if(sidemenuadService.changeStatus(product_serial)==1) {
					System.out.println("판매 상태 변경 성공 ");
				} else {
					System.out.println("판매 상태 변경 실패 ");
				}
			return "redirect:/admin/sidemenuListAd.ad";
		}
		//메뉴 삭제
		
		@RequestMapping(value = "/admin/deleteSidemenu.ad", method = RequestMethod.GET)
		public String  deleteSidemenu(Model model, @RequestParam("product_serial") int product_serial){
			//DB에서 삭제
			if(sidemenuadService.deleteSidemenu(product_serial)==1) {
				System.out.println("메뉴삭제 완료");
			} else {
				System.out.println("메뉴 삭제 실패 ");
			}
			
			System.out.println("삭제 완료");
			
			return "redirect:/admin/sidemenuListAd.ad";
		}
}
