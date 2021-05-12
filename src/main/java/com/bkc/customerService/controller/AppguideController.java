package com.bkc.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppguideController {
	
	@RequestMapping(value = "/customerService/appguide.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String appguide() {
		return "subpages/customerService/appguide";
	}
	
	@RequestMapping(value = "/customerService/inquiry.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String inquiry() {
		return "subpages/customerService/inquiry";
	}

}
