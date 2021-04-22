package com.bkc.subpages.brand.bkcstory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.customerService.vo.FaqVO;
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
	public String BkcstoryList(AboutbkcVO aboutbkcVO, HistoryVO historyVO, Model model) {
		
		List<AboutbkcVO> AboutbkcList = aservice.AboutbkcList(aboutbkcVO);
		List<HistoryVO> HistoryList = hservice.HistoryList(historyVO);
		
		model.addAttribute("HistoryVO", historyVO);
		model.addAttribute("HistoryList", HistoryList);
		model.addAttribute("AboutbkcVO", aboutbkcVO);
		model.addAttribute("AboutbkcList", AboutbkcList);
		
		System.out.println("Story 페이지 실행");
		return "subpages/brand/story";
	}
	
	//admin
	@RequestMapping(value = "/admin/bkcstorylist.ad", method = {RequestMethod.GET})
	public String AdminBkcstoryist(AboutbkcVO aboutbkcVO, HistoryVO historyVO, Model model) {
		
		List<AboutbkcVO> AboutbkcList = aservice.AboutbkcList(aboutbkcVO);
		List<HistoryVO> HistoryList = hservice.HistoryList(historyVO);
		
		model.addAttribute("HistoryVO", historyVO);
		model.addAttribute("HistoryList", HistoryList);
		model.addAttribute("AboutbkcVO", aboutbkcVO);
		model.addAttribute("AboutbkcList", AboutbkcList);
		
		return "admin/subpages/brand/bkcstorylist";
	}
	//history수정화면출력
	@RequestMapping(value = "/admin/historyDetail.ad", method = RequestMethod.GET)
	public String showhistory(Model model, @RequestParam("seq") int seq) {
		
		HistoryVO historyVO = hservice.getHistory(seq);
		model.addAttribute("historyVO", historyVO);
		
		return "admin/subpages/brand/historyContent";
	}
	
	//history수정
	@RequestMapping(value = "/admin/modifyhistory.ad", method = {RequestMethod.GET, RequestMethod.POST })
	public String modifyhistory(Model model, @RequestParam("seq") int seq, @RequestParam("title") String title, @RequestParam("content") String content) {
		
		HistoryVO historyVO = hservice.getHistory(seq);
		historyVO.setSeq(seq);
		historyVO.setTitle(title);
		historyVO.setContent(content);
		
		hservice.updateHistory(historyVO);
		
		model.addAttribute("historyVO", historyVO);
		System.out.println("test :" + historyVO.toString());
		return "redirect:/admin/bkcstorylist.ad";
	}
	
	//history삭제
	@RequestMapping(value = "/admin/deleteHistory.ad", method = RequestMethod.GET)
	public String deleteHistory(Model model, @RequestParam("seq") int seq){
		
		hservice.deleteHistory(seq);
		
		
		System.out.println("삭제 완료");
		
		return "redirect:/admin/bkcstorylist.ad";
		}
	
}
