package com.bkc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {

	@RequestMapping(value = "/admin.mdo", method = RequestMethod.GET)
	public String adminPage() {
		System.out.println("admin 페이지 이동");
		return "admin/adminPage";
	}
	
	@RequestMapping(value = "/goAdminPage.mdo", method = RequestMethod.GET)
	public String goAdminPage() {
		System.out.println("admin 페이지 이동");
		return "admin/dist/index";
	}
}
