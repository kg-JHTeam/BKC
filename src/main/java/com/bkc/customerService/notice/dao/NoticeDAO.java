package com.bkc.customerService.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bkc.customerService.notice.vo.NoticeVO;

@Repository
public interface NoticeDAO {
	
	//게시글 개수
	public int getNoticeTotalCnt(NoticeVO notice);
	//게시글 조회
	public List<NoticeVO> getNoticeList(NoticeVO notice);
	//게시글 상세조회
	public NoticeVO getNotice(NoticeVO notice);
	
}
