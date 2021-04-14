package com.bkc.customerService.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	private ModelAndView getNoticeList(@ModelAttribute SearchVO searchVO) {
		
		ModelAndView view  = new ModelAndView();	
		NoticeVO notice = new NoticeVO();
		
		if(searchVO.getSearchText() != null) {
			notice.setSearchText(searchVO.getSearchText());
		}
			
		int totalPage = noticeService.getNoticeTotalCnt(notice);
			
		//페이징 처리
		PageMaker pager = new PageMaker(searchVO.getPageNum(), totalPage);
			
		notice.setStart(pager.getBeginPage());  // 한페이지의 시작 번호
		notice.setEnd(pager.getEndPage(pager.getBeginPage())); // 한페이지의 끝번호 
			
		List<NoticeVO> noticeList = noticeService.getNoticeList(notice);

		view.addObject("pageing", pager.getPager());
		view.addObject("noticeList", noticeList);
		view.addObject("totalSize", totalPage);
		view.setViewName("subpages/customerService/notice");

		 return view;
	}

	//게시글 상세 조회
	@RequestMapping(value="/getNotice.do")	
	private ModelAndView getNotice(NoticeVO notice, ModelAndView view) {
		
		view.addObject("notice", noticeService.getNotice(notice));
		view.setViewName("subpages/customerService/getNotice");
		return view;
		
	}

}
