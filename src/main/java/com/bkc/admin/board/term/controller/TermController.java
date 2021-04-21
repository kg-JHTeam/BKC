package com.bkc.admin.board.term.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.term.service.TermEmailService;
import com.bkc.admin.board.term.service.TermPrivacyService;
import com.bkc.admin.board.term.service.TermService;
import com.bkc.admin.board.term.vo.TermEmailVO;
import com.bkc.admin.board.term.vo.TermPrivacyVO;
import com.bkc.admin.board.term.vo.TermVO;

@Controller
public class TermController {

	@Autowired
	private TermService termService;
	
	@Autowired
	private TermEmailService termEmailService;
	
	@Autowired
	private TermPrivacyService termPrivacyService;

	// 이용약관 페이지로 가기
	@RequestMapping(value = "/terms.do", method = RequestMethod.GET)
	public String showTerm(Model model) {
		TermVO terms = termService.getTermList();
		model.addAttribute("terms", terms);
		return "subpages/law/terms";
	}

	// 이용약관 관리자 페이지로 가기
	@RequestMapping(value="/admin/term.ad",method=RequestMethod.GET)
	public String showAdminTerm(Model model) {
		TermVO terms = termService.getTermList();
		model.addAttribute("terms", terms);
		return "admin/subpages/law/terms";
	}
	
	// 개인정보취급 방침 페이지로 가기
	@RequestMapping(value = "/termsPrivacy.do", method = RequestMethod.GET)
	public String showTermPrivacy(Model model) {
		TermPrivacyVO termsPrivacy = termPrivacyService.getTermPrivacyList();
		model.addAttribute("termsPrivacy", termsPrivacy);
		return "subpages/law/termsPrivacy";
	}
	
	// 이메일 약관 페이지로 가기
	@RequestMapping(value = "/termsEmail.do", method = RequestMethod.GET)
	public String showTermEmail(Model model) {
		TermEmailVO termsEmail = termEmailService.getTermEmailList();
		model.addAttribute("termsEmail", termsEmail);
		return "subpages/law/termsEmail";
	}
}
