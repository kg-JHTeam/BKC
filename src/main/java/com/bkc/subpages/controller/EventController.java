package com.bkc.subpages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/event", method = RequestMethod.GET)
public class EventController {

	@RequestMapping(value = "/eventPage.do", method = RequestMethod.GET)
	public String eventPage() {
		return "subpages/event/eventPage";
	}

	@RequestMapping(value = "/eventDetail.do", method = RequestMethod.GET)
	public String eventDetail() {
		return "subpages/event/eventDetail";
	}

}
