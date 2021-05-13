package com.bkc.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/error", method = RequestMethod.GET)
public class ErrorController {
	@RequestMapping(value = "/no-resource", method = RequestMethod.GET)
	public String error404() {
		return "error/error404";
	}
	@RequestMapping(value = "/no-authentication", method = RequestMethod.GET)
	public String error403() {
		return "error/error403";
	}
	@RequestMapping(value = "/server-error", method = RequestMethod.GET)
	public String error500() {
		return "error/error500";
	}
}
