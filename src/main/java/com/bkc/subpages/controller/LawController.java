package com.bkc.subpages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/law", method = RequestMethod.GET)
public class LawController {

	@RequestMapping(value = "/term.do", method = RequestMethod.GET)
	public String term() {
		return "subpages/law/term";
	}
	
}
