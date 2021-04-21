package com.bkc.admin.board.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.customerService.vo.NoticeVO;

@Service
public interface AdminNoticeService {

	// 게시글 조회
	public List<NoticeVO> getAdNoticeList(NoticeVO notice);

	// 게시글 상세조회
	public NoticeVO getAdNotice(NoticeVO notice);

	// 게시물 생성
	public void insertNotice(NoticeVO notice);

	// 게시물 수정
	public void updateNotice(NoticeVO notice);

	// 게시물 삭제
	public void deleteNotice(int seq);
}
