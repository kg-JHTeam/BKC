package com.bkc.admin.board.menuInfom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.menuInfom.service.MenuAdService;
import com.bkc.admin.board.menuInfom.vo.MenuAdVO;

@Controller
public class MenuAdController {
	@Autowired
	private MenuAdService menuadService;

	
	
	//메뉴리스트 출력
	@RequestMapping(value = "/admin/menuListAd.ad", method = RequestMethod.GET)
	public String showmenuList(Model model) {
		List<MenuAdVO> admenulist = menuadService.getMenuAdList();
		model.addAttribute("admenulist", admenulist);
		return "admin/subpages/menu/menuListAd";
	}

	// 메뉴상세 출력 
	@RequestMapping(value = "/admin/menuAdContent.ad", method = RequestMethod.GET)
	public String showmenuAd(Model model, @RequestParam("product_serial") int product_serial) {
		MenuAdVO menuad = menuadService.getMenuAd(product_serial);
		System.out.println("product_serial : " + product_serial);
		System.out.println("menuad : " + menuad.toString());
		model.addAttribute("menuad", menuad);
		return "admin/subpages/menu/menuAdContent";
	}

	

}
