package com.bkc.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;


@Controller
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	//회원리스트 출력.
	@RequestMapping(value = "/admin/userlist.ad", method = RequestMethod.GET)
	public String showUsers(Model model) {
		List<UserVO> users = userService.getUserList();
		model.addAttribute("users", users);
		return "admin/subpages/userlist";
	}
}
