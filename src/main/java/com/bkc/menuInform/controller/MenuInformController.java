package com.bkc.menuInform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.menuInform.service.SideMenuService;
import com.bkc.menuInform.vo.SideMenuVO;

@Controller
@RequestMapping(value = "/menuInform", method = RequestMethod.GET)
public class MenuInformController {

	@Autowired
	private SideMenuService sidemenuService;

	@RequestMapping(value = "/chickenMenu.do", method = RequestMethod.GET)
	public String chickenMenu() {
		System.out.println("치킨 메뉴 페이지 실행");
		return "subpages/menuInform/chickenMenu";
	}
	
	@RequestMapping(value = "/chickenmenudetail.do", method = RequestMethod.GET)
	public String chickenMenuDetail() {
		System.out.println("치킨메뉴디테일 페이지 실행");
		return "subpages/menuInform/chickenmenudetail";
	}

	@RequestMapping(value = "/beerZone.do", method = RequestMethod.GET)
	public String beerZone() {
		System.out.println("비어존 메뉴 페이지 실행");
		return "subpages/menuInform/beerZone";
	}
	@RequestMapping(value = "/beerzonedetail.do", method = RequestMethod.GET)
	public String beerZoneDetail() {
		System.out.println("비어존 메뉴 디테일  페이지 실행");
		return "subpages/menuInform/beerzonedetail";
	}

	// 게시글 목록 조회  bkc/menuInform/sideMenu.do
	@RequestMapping(value = "/sideMenu.do")
	private String getSidemenuList(Model model) {

		List<SideMenuVO> sidemenuList = sidemenuService.getSidemenuList();
		System.out.println(sidemenuList);

		model.addAttribute("sidemenuList", sidemenuList);

		return "subpages/menuInform/sideMenu";
	}
	
	// 게시글 디테일
	@RequestMapping(value = "/sidemenudetail.do", method = RequestMethod.GET)
	public String sidemenudetail(SideMenuVO sidemenuvo, Model model) {

		SideMenuVO sidemenu = new SideMenuVO();

		System.out.println(sidemenu);

		model.addAttribute("getSidemenu", sidemenu);

		return "subpages/menu/sidemenudetail";
	}
}
