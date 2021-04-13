package com.bkc.subpages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/map", method = RequestMethod.GET)
public class MapController {
	
	@RequestMapping(value="/store.do",method = RequestMethod.GET)
	public String store() {
		System.out.println("지도 페이지 실행");
		return "subpages/map/store";
	}
}
