package com.bkc.subpages.brand.bkcnews.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BkcnewsController {
	
	@RequestMapping(value = "/brand/newsNewItem.do", method = RequestMethod.GET)
	public String BkcnewsList() {
		
		System.out.println("Story 페이지 실행");
		return "subpages/brand/newsNewItem";
	}
}
