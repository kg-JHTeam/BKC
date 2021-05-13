package com.bkc.admin.board.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.notice.dao.AdminNoticeDAO;
import com.bkc.customerService.vo.NoticeVO;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDAO adNoticeDao;

	// 게시글 목록조회
	@Override
	public List<NoticeVO> getAdNoticeList(NoticeVO notice) {
		return adNoticeDao.getAdNoticeList(notice);
	}

	// 게시글 상세조회
	@Override
	public NoticeVO getAdNotice(NoticeVO notice) {
		return adNoticeDao.getAdNotice(notice);
	}

	// 게시글 생성
	@Override
	public void insertNotice(NoticeVO notice) {
		adNoticeDao.insertNotice(notice);
	}

	// 게시글 수정
	@Override
	public void updateNotice(NoticeVO notice) {
		adNoticeDao.updateNotice(notice);
	}

	// 게시글 삭제
	@Override
	public void deleteNotice(int seq) {
		adNoticeDao.deleteNotice(seq);
	}

}
