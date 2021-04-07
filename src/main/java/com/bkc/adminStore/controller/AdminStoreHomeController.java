package com.bkc.adminStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminStoreHomeController {
	@RequestMapping(value = "/admin.mdo", method = RequestMethod.GET)
	public String adminStorePage() {
		System.out.println("/admin.mdo");
		return "adminStore/adminStorePage";
	}
	
	@RequestMapping(value = "/goAdminPage.mdo", method = RequestMethod.GET)
	public String goAdminStorePage() {
		System.out.println("/adminStore.mdo");
		return "adminStore/dist/index";
	}
}
