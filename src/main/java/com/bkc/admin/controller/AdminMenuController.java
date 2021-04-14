package com.bkc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMenuController {
	@RequestMapping(value = "/admin/userlist.ad", method = RequestMethod.GET)
	public String adminUserlistPage() {
		return "admin/subpages/userlist";
	}
}
