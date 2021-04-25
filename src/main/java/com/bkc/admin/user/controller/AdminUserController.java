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

	// 회원 리스트 출력.
	@RequestMapping(value = "/admin/userlist.ad", method = RequestMethod.GET)
	public String showUsers(Model model) {
		List<UserVO> users = userService.getUserList();
		model.addAttribute("users", users);
		return "admin/subpages/user/userlist";
	}

	// 매장관리자 리스트 출력
	@RequestMapping(value = "/admin/userManagerlist.ad", method = RequestMethod.GET)
	public String showManagerUsers(Model model) {
		List<UserVO> users = userService.getManagerUserList();
		model.addAttribute("users", users);
		return "admin/subpages/user/managerlist";
	}

	// 비회원 리스트 출력
	@RequestMapping(value = "/admin/userNonlist.ad", method = RequestMethod.GET)
	public String showNonUsers(Model model) {
		List<UserVO> users = userService.getNonUserList();
		model.addAttribute("users", users);
		return "admin/subpages/user/nonUserlist";
	}

	// 탈퇴회원 리스트 출력
	@RequestMapping(value = "/admin/userSignoutList.ad", method = RequestMethod.GET)
	public String showSignoutUsers(Model model) {
		List<UserVO> users = userService.getManagerUserList();
		model.addAttribute("users", users);
		return "admin/subpages/user/managerlist";
	}

	// 휴면회원 리스트 출력
	@RequestMapping(value = "/admin/userDormantlist.ad", method = RequestMethod.GET)
	public String showDormantUsers(Model model) {
		List<UserVO> users = userService.getManagerUserList();
		model.addAttribute("users", users);
		return "admin/subpages/user/managerlist";
	}
}
