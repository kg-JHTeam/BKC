package com.bkc.user.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bkc.user.vo.UserVO;
import com.bkc.user.service.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	// 회원 리스트 출력
	@RequestMapping("")
	public String showUsers(Model model) {
		return "";
	}

	// 회원 가입
	@RequestMapping("")
	public String createUser(Model model, @Valid UserVO user, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error:errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "createoffer";
		}
		
		userService.insert(user);
		return "offercreated";
	}

	// 회원 수정
	@RequestMapping("")
	public String modifyUser(Model model, @Valid UserVO user, BindingResult result) {
		// @Valid를 통해 자동 객체 검증

		return "";
	}

	//회원 탈퇴
	@RequestMapping("")
	public String deleteUser(Model model, @Valid UserVO user, BindingResult result) {
		//회원 탈퇴 하지만 enabled만 유효하지 않게 설정 1-> 0 유효하지 않은 회원 
		
		return "";
	}
}
