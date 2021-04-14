package com.bkc.customerService.service;

import java.util.List;

import com.bkc.customerService.vo.NoticeVO;

public interface NoticeService {
	
	//게시글 개수
	public int getNoticeTotalCnt(NoticeVO notice);
	// 글 목록 보기
	public List<NoticeVO> getNoticeList(NoticeVO notice);
	//글 상세 목록 보기
	public NoticeVO getNotice(NoticeVO notice);
}	