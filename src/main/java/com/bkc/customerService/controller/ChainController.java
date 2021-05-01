package com.bkc.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ChainController {

	@RequestMapping(value = "/customerService/chain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chain() {
		return "subpages/customerService/chain";
	}

	@RequestMapping(value = "/customerService/recruit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String recruit() {
		return "subpages/customerService/recruit";
	}

}
