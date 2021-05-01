package com.bkc.admin.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "admin/subpages/user/guestlist";
	}

	// 휴면 해제 처리
	@ResponseBody
	@RequestMapping(value = "/admin/userChangeStatus.ad", method = RequestMethod.POST)
	public Object changeStatus(@RequestParam String userid) {
		// 성공했다고 처리
		Map<String, Object> retVal = new HashMap<String, Object>();
		UserVO user = userService.getUserById(userid);
		
		try {
			if(userService.changeEnabled(user) == 1 ) { 
				retVal.put("code", "OK");
				retVal.put("message", "ok 성공");
			} else { 
				retVal.put("code", "NO");
				retVal.put("message", "실패");
			}
		} catch (Exception e) {
			retVal.put("code", "ERROR");
			retVal.put("message", "실패");
		}
		return retVal;
	}

	// 문자전송
	@ResponseBody
	@RequestMapping(value = "/admin/sendSMS.ad", method = RequestMethod.POST)
	public Object sendSMStoUser(@RequestParam String userid, @RequestParam String text) {

		System.out.println(userid + " 11 " + text);
		System.out.println("문자메시지 전송 controller 실행");

		// 성공했다고 처리
		Map<String, Object> retVal = new HashMap<String, Object>();

		retVal.put("code", "OK");
		retVal.put("message", "ok 성공");
		return retVal;
	}

}
