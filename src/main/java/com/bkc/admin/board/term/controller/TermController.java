package com.bkc.admin.board.term.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.term.service.TermService;
import com.bkc.admin.board.term.vo.TermVO;

@Controller
public class TermController {

	@Autowired
	private TermService termService;

	// 이용약관 페이지로 가기
	@RequestMapping(value = "/terms.do", method = RequestMethod.GET)
	public String showTerm(Model model) {
		TermVO terms = termService.getTermList();
		model.addAttribute("terms", terms);
		return "subpages/law/terms";
	}

	@RequestMapping(value = "/privacy.do", method = RequestMethod.GET)
	public String privacy() {
		return "subpages/law/privacy";
	}

	@RequestMapping(value = "/legal.do", method = RequestMethod.GET)
	public String legal() {
		return "subpages/law/legal";
	}
}
