package com.bkc.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	public HomeController() {
		System.out.println("HomeController 실행");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("start");
		return "index";
	}
}
