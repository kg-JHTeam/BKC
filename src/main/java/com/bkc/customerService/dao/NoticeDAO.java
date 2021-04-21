package com.bkc.customerService.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.NoticeVO;
import com.bkc.customerService.vo.SearchVO;

@Repository
public interface NoticeDAO {
	
	//게시글 개수
	public int getNoticeTotalCnt(NoticeVO notice);
	//게시글 조회
	public List<NoticeVO> getNoticeList(SearchVO searchVO);
	//게시글 상세조회
	public NoticeVO getNotice(NoticeVO notice);
	//게시글 조회수 중가
	public void updateHits(NoticeVO notice);
}
