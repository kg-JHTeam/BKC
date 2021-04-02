package com.bkc.subpages.brand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/brand", method = RequestMethod.GET)
public class BrandController {

	@RequestMapping(value = "/brandStory.do", method = RequestMethod.GET)
	public String story() {
		System.out.println("Story 페이지 실행");
		return "brand/story";
	}
	
	@RequestMapping(value = "/whybkc.do", method = RequestMethod.GET)
	public String whybkc() {
		System.out.println("whybkc 페이지 실행");
		return "brand/whybkc";
	}
	
	@RequestMapping(value = "/newsNewItem.do", method = RequestMethod.GET)
	public String newsNewItem() {
		System.out.println("newsNewItem 페이지 실행");
		return "brand/newsNewItem";
	}
}
