package com.bkc.customerService.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.customerService.service.FaqService;
import com.bkc.customerService.vo.FaqVO;
import com.bkc.customerService.vo.PageMaker;
import com.bkc.customerService.vo.SearchVO;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@RequestMapping(value = "/customerService/faq.do", method = RequestMethod.GET)
	public String FaqList(SearchVO searchVO, FaqVO faqvo, Model model) {
		
		if(faqvo.getCategory() == null) {
			faqvo.setCategory("");
		}
		System.out.println(faqvo.getCategory());
		int totalPage = service.FaqTotalCnt(faqvo);
		
		PageMaker pager = new PageMaker(searchVO.getPageNum(), totalPage);
		
		faqvo.setStart(pager.getBeginPage());  // 한페이지의 시작 번호
		faqvo.setEnd(pager.getEndPage(pager.getBeginPage())); // 한페이지의 끝번호 
		
		List<FaqVO> FaqList = service.FaqList(faqvo);
		model.addAttribute("Faqvo", faqvo);
		model.addAttribute("FaqList", FaqList);
		model.addAttribute("pageing", pager.getPager());
		model.addAttribute("totalSize", totalPage);
		
		return "subpages/customerService/faq";
	}
	
	//Admin
	//홈페이지관리자 페이지 faq 조회
	@RequestMapping(value = "/admin/faqlist.ad", method = RequestMethod.GET)
	public String AdminFaqList(FaqVO faqvo, Model model) {
		
		List<FaqVO> AdminFaqList = service.AdminFaqList(faqvo);
		model.addAttribute("AdminFaqList", AdminFaqList);
		
		return "admin/subpages/faq/faqlist";
	}

}
