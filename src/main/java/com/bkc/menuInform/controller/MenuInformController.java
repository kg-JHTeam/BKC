package com.bkc.menuInform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/menuInform", method = RequestMethod.GET)
public class MenuInformController {
	
	@RequestMapping(value = "/chickenMenu.do", method = RequestMethod.GET)
	public String chickenMenu() {
		System.out.println("치킨 메뉴 페이지 실행");
		return "subpages/menuInform/chickenMenu";
	}
	
	@RequestMapping(value = "/sideMenu.do", method = RequestMethod.GET)
	public String sideMenu() {
		System.out.println("사이드 메뉴 페이지 실행");
		return "subpages/menuInform/sideMenu";
	}

	@RequestMapping(value = "/beerZone.do", method = RequestMethod.GET)
	public String beerZone() {
		System.out.println("비어존 메뉴 페이지 실행");
		return "subpages/menuInform/beerZone";
	}
}
