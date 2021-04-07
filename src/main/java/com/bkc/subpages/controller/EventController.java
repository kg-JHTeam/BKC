package com.bkc.subpages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/event", method = RequestMethod.GET)
public class EventController {

	@RequestMapping(value = "/eventPageAll.do", method = RequestMethod.GET)
	public String eventPageAll() {
		return "subpages/event/eventPageAll";
	}
	@RequestMapping(value = "/eventPageContinue.do", method = RequestMethod.GET)
	public String eventPageContinue() {
		return "subpages/event/eventPageContinue";
	}
	@RequestMapping(value = "/eventPageEnd.do", method = RequestMethod.GET)
	public String eventPageEnd() {
		return "subpages/event/eventPageEnd";
	}
	@RequestMapping(value = "/eventPageNew.do", method = RequestMethod.GET)
	public String eventPageNew() {
		return "subpages/event/eventPageNew";
	}
	@RequestMapping(value = "/eventDetail.do", method = RequestMethod.GET)
	public String eventDetail() {
		return "subpages/event/eventDetail";
	}
}
