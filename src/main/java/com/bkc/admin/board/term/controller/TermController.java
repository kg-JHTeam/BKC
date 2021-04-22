package com.bkc.admin.board.term.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
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

	@Autowired
	private BusinessInformationService biService;

	// 이용약관 페이지로 가기
	@RequestMapping(value = "/terms.do", method = RequestMethod.GET)
	public String showTerm(Model model) {
		TermVO terms = termService.getTermList();
		model.addAttribute("terms", terms);
		
		//푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		
		return "subpages/law/terms";
	}

	// 이용약관 관리자 페이지 게시판 상세 보기 
	@RequestMapping(value = "/admin/term.ad")
	public String showAdminTerm(TermVO term, Model model) {
		TermVO vo = termService.getTermList(term);
		model.addAttribute("terms", vo);
		return "admin/subpages/law/terms";
	}
	
	// 이용약관 관리자 페이지 게시판 수정화면으로 이동
	@RequestMapping(value = "/admin/updateTerms.ad")
	public String updateTerm(TermVO term, Model model) {
		TermVO vo = termService.getTermList(term);
		model.addAttribute("terms", vo);
		return "admin/subpages/law/updateTerms";		
	}
	
	// 이용약관 관리자 페이지 게시판 수정
	@RequestMapping(value = "/admin/updateTermDB.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateTermDB(TermVO term) {
		termService.updateTerm(term);
		return "redirect:/admin/term.ad";
	}

	// 개인정보취급 방침 페이지로 가기
	@RequestMapping(value = "/termsPrivacy.do", method = RequestMethod.GET)
	public String showTermPrivacy(Model model) {
		TermPrivacyVO termsPrivacy = termPrivacyService.getTermPrivacyList();
		model.addAttribute("termsPrivacy", termsPrivacy);
		
		//푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "subpages/law/termsPrivacy";
	}

	// 이메일 약관 페이지로 가기
	@RequestMapping(value = "/termsEmail.do", method = RequestMethod.GET)
	public String showTermEmail(Model model) {
		TermEmailVO termsEmail = termEmailService.getTermEmailList();
		model.addAttribute("termsEmail", termsEmail);
		
		//푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "subpages/law/termsEmail";
	}
}
