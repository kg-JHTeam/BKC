package com.bkc.user.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bkc.user.service.UserServiceImpl;
import com.bkc.user.vo.UserVO;


//@Controller
public class UserController {
	@Autowired
	private UserServiceImpl userService;

	// 회원 리스트 출력
	@RequestMapping("/showusers")
	public String showUsers(Model model) {
		return "showusers";
	}

	// 회원 가입
	@RequestMapping("/createuser")
	public String createUser(Model model, @Valid UserVO user, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error:errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			return "join";  //에러났을때 -> 모델 가져가면서 join으로 
		}
		
		userService.insert(user); //성공한 경우 
		return "usercreated";
	}

	// 회원 수정
	@RequestMapping("/modifyuser")
	public String modifyUser(Model model, @Valid UserVO user, BindingResult result) {
		// @Valid를 통해 자동 객체 검증

		return "modifyuser";
	}

	//회원 탈퇴
	@RequestMapping("/deleteuser")
	public String deleteUser(Model model, @Valid UserVO user, BindingResult result) {
		//회원 탈퇴 하지만 enabled만 유효하지 않게 설정 1-> 0 유효하지 않은 회원 
		
		return "deleteuser";
	}
}
