package com.bkc.customerService.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bkc.customerService.service.NoticeService;
import com.bkc.customerService.vo.NoticeVO;
import com.bkc.customerService.vo.PageMaker;
import com.bkc.customerService.vo.SearchVO;

@Controller
@RequestMapping(value = "/customerService")
public class NoticeController {

	private NoticeService noticeService;

	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	//게시글 목록 조회
	@RequestMapping(value="/notice.do")
	private String getNoticeList(Model model, SearchVO searchVO) {
			
		NoticeVO notice = new NoticeVO();
		
		if(searchVO.getSearchText() != null) {
			notice.setSearchText(searchVO.getSearchText());
		}
			
		int totalPage = noticeService.getNoticeTotalCnt(notice);
			
		//페이징 처리
		PageMaker pager = new PageMaker(searchVO.getPageNum(), totalPage);
			
		searchVO.setStart(pager.getBeginPage());  // 한페이지의 시작 번호
		searchVO.setEnd(pager.getEndPage(pager.getBeginPage())); // 한페이지의 끝번호 
			
		List<NoticeVO> noticeList = noticeService.getNoticeList(searchVO);

		model.addAttribute("pageing", pager.getPager());
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("totalSize", totalPage);
		System.out.println(pager.getBeginPage());
		return "subpages/customerService/notice";
	}


	//게시글 상세 조회
	@RequestMapping(value="/getNotice.do")	
	private String getNotice(NoticeVO notice, Model model) {
		
		NoticeVO vo = noticeService.getNotice(notice);
		System.out.println(vo);
		noticeService.updateHits(notice);
		model.addAttribute("notice", vo);
		return "subpages/customerService/getNotice";
		
	}

}
