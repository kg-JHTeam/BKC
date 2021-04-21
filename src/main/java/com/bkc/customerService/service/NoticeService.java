package com.bkc.customerService.service;

import java.util.List;

import com.bkc.customerService.vo.NoticeVO;
import com.bkc.customerService.vo.SearchVO;

public interface NoticeService {
	
	//게시글 개수
	public int getNoticeTotalCnt(NoticeVO notice);
	// 글 목록 보기
	public List<NoticeVO> getNoticeList(SearchVO searchVO);
	//글 상세 목록 보기
	public NoticeVO getNotice(NoticeVO notice);
	//게시글 조회수 중가
	public void updateHits(NoticeVO notice);
}	
