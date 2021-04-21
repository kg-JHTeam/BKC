package com.bkc.subpages.brand.bkcstory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.subpages.brand.bkcstory.service.AboutbkcService;
import com.bkc.subpages.brand.bkcstory.service.HistoryService;
import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;


@Controller
public class BkcstoryController {
	
	@Autowired
	private AboutbkcService aservice;
	
	@Autowired
	private HistoryService hservice;
	
	//aboutBKC
	@RequestMapping(value = "/brand/brandStory.do", method = RequestMethod.GET)
	public String AboutbkcList(AboutbkcVO aboutbkcVO, Model model) {
		
		List<AboutbkcVO> AboutbkcList = aservice.AboutbkcList(aboutbkcVO);
		
		model.addAttribute("AboutbkcVO", aboutbkcVO);
		model.addAttribute("AboutbkcList", AboutbkcList);
		
		System.out.println("Story 페이지 실행");
		return "subpages/brand/story";
	}
	
	/*
	//History
		@RequestMapping(value = "/brand/brandStory.do", method = RequestMethod.GET)
		public String HistoryList(HistoryVO historyVO, Model model) {
			
			List<HistoryVO> HistoryList = hservice.HistoryList(historyVO);
			
			model.addAttribute("HistoryVO", historyVO);
			model.addAttribute("HistoryList", HistoryList);
			
			System.out.println("Story 페이지 실행");
			return "subpages/brand/story";
		}
	*/
}
