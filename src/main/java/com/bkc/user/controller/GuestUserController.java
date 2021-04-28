package com.bkc.user.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.user.service.GuestUserService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
public class GuestUserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);


	@Autowired
	private GuestUserService guestUserService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private BusinessInformationService biService;

	// 비회원 주문페이지로 이동.
	@RequestMapping(value = "/guestUserPage", method = { RequestMethod.GET, RequestMethod.POST })
	public String goGuestUserControllerPage(Model model) {
		// 푸터 삽입
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/guestUserPage";
	}

	// 이름 이메일 번호를 받아 인증을 한다.
	// 이메일 인증 처리
	@ResponseBody
	@RequestMapping(value = "/guestemail", method = { RequestMethod.GET, RequestMethod.POST })
	public String goGuestUserEmailVerify(@RequestParam String email) {

		// userid 에 인증번호를 보낸다.
		String checkNumber = guestUserService.sendVerifyEmail(email);
		System.out.println(email + "|"  + checkNumber);
		
		// 메시지 보내기 성공 및 전송결과 출력
		return checkNumber;
	}

	// 이메일 인증 처리 완료 하고 비회원 회원가입 처리
	@RequestMapping(value = "/guestUserJoin", method = { RequestMethod.GET, RequestMethod.POST })
	public String goGuestUserJoin(Model model, 
			@RequestParam String username, @RequestParam String userid, @RequestParam String password
			) {
		
		CheckVO check = new CheckVO();
		check.setSuccess("default");  //성공햇는지 확인

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		
		try {
			
			//1. 비회원으로 회원가입을 시키고
			UserVO user = new UserVO();
			user.setUserid(userid);
			user.setName(username);
			user.setUsergrade(3); //set user
			user.setRegist_type(2); //비회원은 2
			user.setPassword(password);
			user.setPhone("default");
			user.setEnabled(true);
			
			// 내부적으로 BCryptPasswordEncoder로 암호화 로직 수행
			userService.insert(user);
			
			//2. 로그인을 시켜서 주문을 하도록 보낸다.
			System.out.println("비회원 완료 ");
			return "delivery/login";
			
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			check.setSuccess("1");		//이미 회원입니다.  
			model.addAttribute("check", check);
			return "delivery/guestUserPage"; //redirect
		} catch (Exception e) {
			e.printStackTrace();
			check.setSuccess("3");	//다른에러 
			model.addAttribute("check", check);
			return "delivery/guestUserPage"; //redirect
		}
	}
}