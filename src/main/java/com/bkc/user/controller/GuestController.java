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
import com.bkc.user.service.GuestService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.GuestVO;

@Controller
public class GuestController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private GuestService guestService;

	@Autowired
	private UserService userService;

	@Autowired
	private BusinessInformationService biService;

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

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

		String checkNumber = guestService.sendVerifyEmail(email);
		System.out.println(email + "|" + checkNumber);

		// 메시지 보내기 성공 및 전송결과 출력
		return checkNumber;
	}

	// 이메일 인증 처리 완료 하고 비회원 회원가입 처리 -- 하고 바로 로그인 시키기.
	@RequestMapping(value = "/guestUserJoin", method = { RequestMethod.GET, RequestMethod.POST })
	public String goGuestUserJoin(HttpSession session,
			Model model, @RequestParam String username, @RequestParam String password,
			@RequestParam String email) {

		CheckVO check = new CheckVO();
		check.setSuccess("default"); // 성공햇는지 확인

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		// 1. 비회원으로 회원가입을 시키고
		GuestVO guest = new GuestVO();
		guest.setEmail(email);
		guest.setUsername(username);

		// 회원 임시 비밀번호 세팅 - 암호화 시킴
		String pwd = passwordEncoder.encode(password);
		guest.setPassword(pwd);
		session.setAttribute("guest", email);
		 
		// 내부적으로 BCryptPasswordEncoder로 암호화 로직 수행
		if (guestService.insert(guest) == 1) {
			check.setSuccess("1");
			System.out.println("비회원 완료 ");
			return "redirect:/guestDelivery";
		} else {
			check.setSuccess("3"); // 다른에러
			return "delivery/guestUserPage"; // redirect
		}
	}
	
	//guest를 세션에 넣어두고 주문할 수 있도록 보낸다. 
	@RequestMapping(value = "/guestDelivery", method = { RequestMethod.GET, RequestMethod.POST })
	public String goGuestDeliveryPage(Model model, HttpSession session) {
		String guest = (String) session.getAttribute("guest"); 
		model.addAttribute("guest", guest);
		return "guest/guestdelivery";
	}
}