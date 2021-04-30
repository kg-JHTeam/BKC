package com.bkc.admin.board.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.NoticeVO;

@Repository
public class AdminNoticeDAOImpl implements AdminNoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	// 게시글 전체조회
	@Override
	public List<NoticeVO> getAdNoticeList(NoticeVO notice) {
		System.out.println("getAdNoticeList() 수행");
		return sqlSession.selectList("getAdNoticeList", notice);
	}

	// 게시글 상세조회
	@Override
	public NoticeVO getAdNotice(NoticeVO notice) {
		System.out.println("getAdNotice() 수행");
		return sqlSession.selectOne("getAdNotice", notice);
	}

	// 게시글 생성
	@Override
	public void insertNotice(NoticeVO notice) {
		sqlSession.insert("insertNotice", notice);
		System.out.println("insertNotice() 수행");
	}

	// 게시글 수정
	@Override
	public void updateNotice(NoticeVO notice) {
		sqlSession.insert("updateNotice", notice);
		System.out.println("updateNotice() 수행");
	}

	// 게시글 삭제
	@Override
	public void deleteNotice(int seq) {
		sqlSession.delete("deleteNotice", seq);
		System.out.println("deleteNotice() 수행");
	}

}
