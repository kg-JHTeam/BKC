package com.bkc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("/brand")
public class HomeBrandController {
	
	@RequestMapping(value = "/brand/story", method = RequestMethod.GET)
	public String story() {
		return "brand/story";
	}
	
	@RequestMapping(value = "/brand/whybkc", method = RequestMethod.GET)
	public String whybkc() {
		return "brand/whybkc";
	}
	
	@RequestMapping(value = "/brand/newsNewItem", method = RequestMethod.GET)
	public String newsNewItem() {
		return "brand/newsNewItem";
	}
}
