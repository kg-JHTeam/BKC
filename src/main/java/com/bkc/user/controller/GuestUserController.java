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
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.user.service.GuestUserService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.GuestUserVO;
import com.bkc.user.vo.UserVO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.thoughtworks.qdox.parser.ParseException;

@Controller
public class GuestUserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private GuestUserService guestUserService;

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
	@RequestMapping(value = "/GuestUserJoin", method = { RequestMethod.GET, RequestMethod.POST })
	public String goGuestUserJoin(Model model, @ModelAttribute("guestuser") @Valid GuestUserVO guestuser,
			BindingResult result) {
		
		// checking
		CheckVO check = new CheckVO();
		check.setSuccess("default");

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		
		try {
			// 폼에 에러가 있는 경우 처리
			if (result.hasErrors()) {
				List<ObjectError> errors = result.getAllErrors();
				for (ObjectError error : errors) {
					if (error.getDefaultMessage().contentEquals("이메일 형식만 가능합니다.")) {
						check.setSuccess("2"); //이메일 형식이 아닌 경우 
					} else {
						check.setSuccess("3"); //다른에러 
					}
				}
				model.addAttribute("check", check);
				return "delivery/guestUserPage";
			}
			//오류없는 경우 
			check.setSuccess("0");
			model.addAttribute("check", check);
			return "delivery/delivery.do";

		} catch (DataIntegrityViolationException e) {
			check.setSuccess("1");		//이미 회원입니다.  
			model.addAttribute("check", check);
			return "delivery/joindetail";
		} catch (Exception e) {
			check.setSuccess("3");	//다른에러 
			model.addAttribute("check", check);
			return "delivery/joindetail";
		}
	}
}