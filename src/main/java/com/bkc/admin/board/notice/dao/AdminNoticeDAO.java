package com.bkc.admin.board.notice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.NoticeVO;

@Repository
public interface AdminNoticeDAO {

	/* 관리자페이지-게시글 목록조회, 상세조회, 생성, 수정, 삭제 */

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
