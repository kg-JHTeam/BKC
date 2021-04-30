package com.bkc.customerService.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.banner.vo.BannerVO;
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
	@RequestMapping(value = "/admin/faqlist.ad", method = {RequestMethod.GET})
	public String AdminFaqList(FaqVO faqvo, Model model) {
		
		List<FaqVO> AdminFaqList = service.AdminFaqList(faqvo);
		model.addAttribute("AdminFaqList", AdminFaqList);
		
		return "admin/subpages/faq/faqlist";
	}
	
	//삭제
	@RequestMapping(value = "/admin/FaqDelete.ad", method = RequestMethod.GET)
	public String FaqDelete(Model model, @RequestParam("seq") int seq){
		service.FaqDelete(seq);
		System.out.println("삭제 완료");
		return "redirect:/admin/faqlist.ad";
	}
	
	//추가
	@RequestMapping(value = "/admin/faqUpload.ad", method = {RequestMethod.GET})
	public String faqUpload(@RequestParam String category, @RequestParam String title, @RequestParam String contents)throws IOException, PSQLException {
		FaqVO faqVO = new FaqVO();
		faqVO.setCategory(category);
		faqVO.setTitle(title);
		faqVO.setContents(contents);
		service.FaqInsert(faqVO);
		return "redirect:/admin/faqlist.ad";
	}
	//업로드
	@RequestMapping(value = "/admin/faqUploadpage.ad", method = RequestMethod.GET)
	public String FaqInsert() {
		return "admin/subpages/faq/faqUploadpage";
	}
	
	//수정화면출력
	@RequestMapping(value = "/admin/faqDetail.ad", method = RequestMethod.GET)
	public String showFaq(Model model, @RequestParam("seq") int seq) {
		FaqVO faqVO = service.getFaq(seq);
		model.addAttribute("faqVO", faqVO);
		return "admin/subpages/faq/faqContent";
	}
	//수정
	@RequestMapping(value = "/admin/modifyFaq.ad", method = RequestMethod.GET)
	public String modifyFaq(@RequestParam("title") String title, @RequestParam("contents") String contents, @RequestParam("category") String category, Model model, @RequestParam("seq") int seq) {
		FaqVO faqVO = service.getFaq(seq);
		faqVO.setTitle(title);
		faqVO.setCategory(category);
		faqVO.setContents(contents);
		faqVO.setSeq(seq);
		service.updateFaq(faqVO);
		
		model.addAttribute("faqVO", faqVO);
		System.out.println("test :" + faqVO.toString());
		return "redirect:/admin/faqlist.ad";
	}
	
}
