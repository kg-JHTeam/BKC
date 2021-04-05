package com.bkc.subpages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/menu", method = RequestMethod.GET)
public class MenuController {
	
	@RequestMapping(value = "/menu.do", method = RequestMethod.GET)
	public String whybkc() {
		return "subpages//menu/menu";
	}
}

