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
	
	@Autowired
	private JavaMailSender mailSender;

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
		
		sendJoinMail(user);
		
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
	
	// 회원가입 이후 - 메일 발송 기능
	public void sendJoinMail(UserVO vo) {
		String mailTo = vo.getUserid(); //아이디가 곧 이메일
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			String content = 
				"<div style = font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid #ffd84a; margin: 100px auto; padding: 30px 0; box-sizing: border-box;'>"
				+"<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
					+"<span style='font-size: 15px; margin: 0 0 10px 3px;'>BKC</span><br />"
					+"<span style='color: #ffd84a;'>BKC 회원가입 </span> 안내입니다."
				+"</h1>"
				+"<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>"
					+"<b>" + vo.getName() + "</b>님 환영합니다! <br/>"
					+ "BKC 에 가입해 주셔서 진심으로 감사드립니다.<br/>"
				+"</p>"
				+"</div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				System.out.println("이메일 전송 과정 실행");
				mimeMessage.setFrom(new InternetAddress("bkc1wogh@gmail.com","BKC", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("BCK에 가입하신것을 환영합니다.", "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent(content, "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};
		
		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}