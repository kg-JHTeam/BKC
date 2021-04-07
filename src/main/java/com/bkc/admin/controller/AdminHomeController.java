package com.bkc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {

	@RequestMapping(value = "/admin.ad", method = RequestMethod.GET)
	public String adminPage() {
		System.out.println("/admin.ad");
		return "admin/adminPage";
	}
	
	@RequestMapping(value = "/goAdminPage.ad", method = RequestMethod.GET)
	public String goAdminPage() {
		System.out.println("/goAdminPage.ad");
		return "admin/dist/index";
	}
}
