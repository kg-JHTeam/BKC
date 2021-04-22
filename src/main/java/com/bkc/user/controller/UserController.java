package com.bkc.user.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserService userService;

	@Autowired
	private BusinessInformationService biService;

	// login 처리
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String doLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMsg", "유효하지 않은 회원 입니다.");
		}
		if (logout != null) {
			model.addAttribute("logoutMsg", "로그아웃 되었습니다.");
		}

		// 푸터 넣기
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "delivery/login";
	}

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(Model model) {
		// 푸터 넣기
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		System.out.println("회원가입 페이지 이동");
		return "delivery/join";
	}

	// 회원가입 디테일 페이지로 이동
	@RequestMapping(value = "/joindetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinDetail(Model model) {
		System.out.println("회원가입 디테일 페이지 이동");

		// 푸터 넣기
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		model.addAttribute("user", new UserVO());
		
		// checking
		CheckVO check = new CheckVO();
		check.setSuccess("default");
		model.addAttribute("check", check);
		
		return "delivery/joindetail";
	}

	// 아이디 & 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/userfind", method = { RequestMethod.GET, RequestMethod.POST })
	public String userfind(Model model) {
		System.out.println("아이디 & 비밀번호 찾기 페이지 이동");

		// 푸터 넣기
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "delivery/userfind";
	}

	// 회원 가입
	@RequestMapping(value = "/joinuser", method = { RequestMethod.GET, RequestMethod.POST })
	public String createUser(Model model, @ModelAttribute("user") @Valid UserVO user, BindingResult result) {

		// checking
		CheckVO check = new CheckVO();
		check.setSuccess("default");
		
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		
		/*
							  <join check protocol>  
							  0 : 성공
							  1 : DataIntegrityViolationException 중복 
							  2 : 아이디 이메일형식으로
							  3 : 에러 처리
							  4 : 휴대폰 번호. 
							  default : 회원가입 실패
		 */

		try {
			// 폼에 에러가 있는 경우 처리
			if (result.hasErrors()) {
				List<ObjectError> errors = result.getAllErrors();
				for (ObjectError error : errors) {
					if(error.getDefaultMessage().contentEquals("이메일 형식만 가능합니다.")) {
						check.setSuccess("2");
					} else {
						check.setSuccess("3");
					}
				}
				model.addAttribute("check", check);
				return "delivery/joindetail";
			}

			userService.insert(user);
			userService.sendJoinMail(user); // 이메일 전송
			check.setSuccess("0");
			model.addAttribute("check", check);
			return "delivery/joinsucess";

		} catch (DataIntegrityViolationException e) {
			check.setSuccess("1");
			model.addAttribute("check", check);
			return "delivery/joindetail";
		} catch (Exception e) {
			check.setSuccess("3");
			model.addAttribute("check", check);
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

	// 아이디 찾기/비밀번호 찾기 url나누기
	@PostMapping("/finduser")
	public String spiltFindLogin(Model model, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttr, @RequestParam("check") String check, @RequestParam("name") String name,
			@RequestParam("checkStr") String checkStr) {

		// checkString -> phone / username
		// 핸드폰 번호 인 경우
		System.out.println(name + " : " + checkStr);
		if (check == "" || name == "") {
			return "redirect:/userfind";
		}
		if (check.equals("true")) {
			System.out.println(check);
			System.out.println("아이디 찾기 ");
			redirectAttr.addFlashAttribute("name", name);
			redirectAttr.addFlashAttribute("phone", checkStr);
			return "redirect:/findid";
		} 
		
		// 이메일 인 경우
		else {
			System.out.println("비밀번호 찾기 ");
			redirectAttr.addFlashAttribute("name", name);
			redirectAttr.addFlashAttribute("userid", checkStr);
			return "redirect:/findpwd";
		}
	}

	// 아이디 찾기
	@RequestMapping(value = "/findid", method = { RequestMethod.GET, RequestMethod.POST })
	public String findIdUser(HttpServletRequest request, HttpServletResponse response, Model model) {

		// 이름과 전화번호에 맞는 아이디를 출력해준다.
		try {
			// 푸터 넣기
			BusinessInformationVO bi = biService.getBusinessInformation(1);
			model.addAttribute("bi", bi);

			String name = "";
			String phone = "";
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			if (redirectMap != null) {
				name = (String) redirectMap.get("name"); // 오브젝트 타입이라 캐스팅해줌
				phone = (String) redirectMap.get("phone");
			}

			UserVO vo = userService.getUserByNameAndPhone(name, phone);

			// 없는 아이디 인 경우
			if (vo.getUserid() == null) {
				return "redirect:/userfind";
			}
			model.addAttribute("vo", vo); // 아이디 보내기
			return "delivery/findidsuccess";

		} catch (Exception e) {
			e.printStackTrace();
			// name 과 phone이 같은 경우 는 어케해야되나? 없을걸?
			return "redirect:/userfind";
		}
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findpwd", method = { RequestMethod.GET, RequestMethod.POST })
	public String findpwdUser(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			String name = "";
			String userid = "";

			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			if (redirectMap != null) {
				name = (String) redirectMap.get("name"); // 오브젝트 타입이라 캐스팅해줌
				userid = (String) redirectMap.get("userid");
			}
			// 이메일을 통해 UserVO 얻음.
			UserVO vo = userService.getUserById(userid);

			// 비밀번호 찾기시 이메일로 인증 비밀번호 전송
			// 인증 번호와 일치하면, 확인 시킴.
			// 임시비밀번호 생성 후 바로 전송
			String pwd = userService.sendTempPassword(vo);

			// 회원 임시 비밀번호 세팅 - 암호화 시킴
			pwd = passwordEncoder.encode(pwd);
			vo.setPassword(pwd);

			// 회원 임시비밀번호 암호화하여 update 수행
			if (userService.updatePasswd(vo) == 1) {
				System.out.println("변경 성공 ");
			} else {
				System.out.println("변경 실패 ");
			}

			// model에 UserVO 담아서 보냄.
			model.addAttribute("vo", vo);

			// 푸터 넣기
			BusinessInformationVO bi = biService.getBusinessInformation(1);
			model.addAttribute("bi", bi);

			// 비밀번호 변경 완료 된후 findepwdsuccess page로 이동
			return "delivery/findpwdsuccess";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/userfind";
		}

	}
}