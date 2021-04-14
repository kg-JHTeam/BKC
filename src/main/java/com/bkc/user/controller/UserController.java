package com.bkc.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserService userService;

	// login 처리
	@RequestMapping(value="/login", method={ RequestMethod.GET, RequestMethod.POST })
	public String doLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMsg", "유효하지 않은 회원 입니다.");
		}
		if (logout != null) {
			model.addAttribute("logoutMsg", "로그아웃 되었습니다.");
		}
		return "delivery/login";
	}

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join() {
		System.out.println("회원가입 페이지 이동");
		return "delivery/join";
	}

	// 회원가입 디테일 페이지로 이동
	@RequestMapping(value = "/joindetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinDetail(Model model) {
		System.out.println("회원가입 디테일 페이지 이동");
		model.addAttribute("user", new UserVO());
		return "delivery/joindetail";
	}

	// 회원 가입
	@RequestMapping(value = "/joinuser", method = { RequestMethod.GET, RequestMethod.POST })
	public String createUser(Model model, @ModelAttribute("user") @Valid UserVO user, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			List<ObjectError> errors = result.getAllErrors();

			for (ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "delivery/joindetail"; // 에러났을때 -> 모델 가져가면서 join으로
		}

		if (userService.insert(user)) {
			// service 로직 수행 성공
			return "delivery/joinsucess";
		} else {
			// service 로직 수행중 문제 발생
			return "delivery/joindetail";
		}
	}

	// 회원 수정
	@RequestMapping("/modifyuser")
	public String modifyUser(Model model, @Valid UserVO user, BindingResult result) {
		// @Valid를 통해 자동 객체 검증
		return "modifyuser";
	}

	// 회원 탈퇴
	@RequestMapping("/deleteuser")
	public String deleteUser(Model model, @Valid UserVO user, BindingResult result) {
		// 회원 탈퇴 하지만 enabled만 유효하지 않게 설정 1-> 0 유효하지 않은 회원
		return "deleteuser";
	}
	
	//Admin
	//회원 리스트 출력 
	@RequestMapping("/getUserList.ad")
	public String getUserList(Model model) {
		
		return "getUserList";
	}
	
}