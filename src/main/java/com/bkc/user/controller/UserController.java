package com.bkc.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
import com.bkc.user.vo.MailVO;
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


	// 아이디 & 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/userfind", method = { RequestMethod.GET, RequestMethod.POST })
	public String userfind() {
		System.out.println("아이디 & 비밀번호 찾기 페이지 이동");
		return "delivery/userfind";
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
			// insert 로직 수행 성공시-> 회원가입 확인 메일 전송 
			userService.sendJoinMail(user); 
			return "delivery/joinsucess";
		} else {
			// insert 로직 수행중 문제 발생
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
	
	// 비밀번호 찾기
	@RequestMapping("/findpwd")
	public String findpwdUser(@RequestParam("userid") String userid, Model model) {
		 
		//이메일을 통해 UserVO 얻음. 
		UserVO vo = userService.getUserById(userid);
		
		//비밀번호 찾기시 이메일로 인증 비밀번호 전송 
		//인증 번호와 일치하면, 확인 시킴. 
		
		//임시비밀번호 생성 후 바로 전송 
		String pwd = userService.sendTempPassword(vo);
		
		//회원 임시 비밀번호 세팅 - 암호화 시킴   
		pwd = passwordEncoder.encode(pwd);
		vo.setPassword(pwd);
		
		//회원 임시비밀번호 암호화하여 update 수행
		if(userService.updatePasswd(vo) == 1) {
			System.out.println("변경 성공 ");
		} else {
			System.out.println("변경 실패 ");
		}
		
		model.addAttribute("vo", vo);
		
		//비밀번호 변경 완료 된후 findepwdsuccess page로 이동 
		return "delivery/findpwdsuccess";
	}
}	