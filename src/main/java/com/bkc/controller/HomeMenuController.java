package com.bkc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("/menu")
public class HomeMenuController {
	
	
	@RequestMapping(value = "/menu/menu", method = RequestMethod.GET)
	public String whybkc() {
		return "menu/menu";
	}
}

