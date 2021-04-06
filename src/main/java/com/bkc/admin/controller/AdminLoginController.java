package com.bkc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminLoginController {
	@RequestMapping(value = "/adminLogin")
	public String adminLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMsg", "유효하지 않은 관리자 입니다.");
		}
		if (logout != null) {
			model.addAttribute("logoutMsg", "관리자가 로그아웃 되었습니다.");
		}
		System.out.println("adminLogin 페이지 이동");
		return "admin/login";
	}
}
