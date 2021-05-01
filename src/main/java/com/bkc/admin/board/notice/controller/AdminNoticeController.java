package com.bkc.admin.board.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.notice.service.AdminNoticeService;
import com.bkc.customerService.vo.NoticeVO;

@Controller
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adNoticeService;
	
	//게시판 목록보기
	@RequestMapping(value="/admin/noticelist.ad", method=RequestMethod.GET)
	private String getAdNoticeList(Model model) {
		
		NoticeVO notice = new NoticeVO();	
		List<NoticeVO> adNoticeList = adNoticeService.getAdNoticeList(notice);
		
		model.addAttribute("adNoticeList", adNoticeList);
		return "admin/subpages/notice/noticelist";
	}
	
	//게시판 상세보기
	@RequestMapping(value="/admin/getNotice.ad")	
	private String getAdNotice(NoticeVO notice, Model model) {
		
		NoticeVO vo = adNoticeService.getAdNotice(notice);
		model.addAttribute("notice", vo);
		return "admin/subpages/notice/getNotice";
	}
	
	//게시물 생성화면
	@RequestMapping(value="/admin/insertNotice.ad")
	public String insertNotice(Model model) {
		return  "admin/subpages/notice/insertNotice";
	}
	
	//게시물 생성
	@RequestMapping(value="/admin/insertNoticeDB.ad",  method ={ RequestMethod.GET, RequestMethod.POST })
	private String insertDB(NoticeVO notice) {
		adNoticeService.insertNotice(notice);
		return "redirect:/admin/noticelist.ad";
	}
	
	//게시물 수정화면
	@RequestMapping(value="/admin/updateNotice.ad")
	private String updateNotice(NoticeVO notice, Model model) {
		
		NoticeVO vo = adNoticeService.getAdNotice(notice);
		model.addAttribute("notice", vo);
		return "admin/subpages/notice/updateNotice";
	}
	
	//게시물 수정
	@RequestMapping(value="/admin/updateNoticeDB.ad", method ={ RequestMethod.GET, RequestMethod.POST })
	private String updateNoticeDB(NoticeVO notice) {
		adNoticeService.updateNotice(notice);
		return "redirect:/admin/noticelist.ad";
	}
	
	//게시물 삭제
	@RequestMapping(value="/admin/deleteNoticeDB.ad", method={RequestMethod.GET, RequestMethod.POST})
	private String deleteNoticeDB(int seq) {
		adNoticeService.deleteNotice(seq);
		return "redirect:/admin/noticelist.ad";
	}
}
