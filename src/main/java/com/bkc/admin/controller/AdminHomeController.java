package com.bkc.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
public class AdminHomeController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/admin.ad", method = RequestMethod.GET)
	public String adminPage() {
		System.out.println("/admin.ad");
		return "admin/adminPage";
	}
	
	@RequestMapping(value = "/goAdminPage.ad", method = RequestMethod.GET)
	public String goAdminPage(Model model) {
		System.out.println("/goAdminPage.ad");
		
		List<UserVO> users = userService.getUserList();
		model.addAttribute("users", users);
		
		return "admin/dist/index";
	}
}
