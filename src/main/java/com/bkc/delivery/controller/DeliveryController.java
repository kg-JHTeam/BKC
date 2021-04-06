package com.bkc.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/delivery", method = RequestMethod.GET)
public class DeliveryController {
	
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery() {
		System.out.println("delivery 페이지 이동");
		return "delivery/delivery";
	}
}


