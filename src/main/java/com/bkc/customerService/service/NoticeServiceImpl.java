package com.bkc.customerService.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.customerService.dao.NoticeDAO;
import com.bkc.customerService.vo.NoticeVO;
import com.bkc.customerService.vo.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDao;
	
	@Autowired
	public void setNoticeDao(NoticeDAO noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public int getNoticeTotalCnt(NoticeVO notice) {
		return noticeDao.getNoticeTotalCnt(notice);
	}


	@Override
	public List<NoticeVO> getNoticeList(SearchVO searchVO) {
		return noticeDao.getNoticeList(searchVO);
	}	

	@Override
	public NoticeVO getNotice(NoticeVO notice) {
		return noticeDao.getNotice(notice);
	}

	@Override
	public void updateHits(NoticeVO notice) {
		 noticeDao.updateHits(notice);
	}

	
}
