package com.bkc.admin.board.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.event.vo.EventVO;

@Repository
public  class AdminEventDAOImpl implements AdminEventDAO {

	@Autowired
	private SqlSession sqlSession;

	//이벤트 전체 목록
	@Override
	public List<EventVO> getAdEventList(EventVO event) {
		return sqlSession.selectList("getAdEventList");
	}

	//이벤트 상세
	@Override
	public EventVO getAdEvent(int seq) {
		return sqlSession.selectOne("getAdEvent", seq);
	}

	//이벤트 등록
	@Override
	public int insertEvent(EventVO event) {
		return sqlSession.insert("insertEvent", event);
	}

	//이벤트 상세등록
	@Override
	public int insertEventDetail(EventVO event) {
		return sqlSession.insert("insertEventDetail", event);
	}

	//이벤트 수정
	@Override
	public int updateEvent(EventVO event) {
		return sqlSession.insert("updateEvent", event);
	}

	//이벤트 상세 수정
	@Override
	public int updateEventDetail(EventVO event) {
		return sqlSession.insert("updateEventDetail", event);
	}

	//이벤트 삭제
	@Override
	public int deleteEvent(EventVO event) {
		return sqlSession.delete("deleteEvent", event);
	}

	//이벤트 상태변경
	@Override
	public int eventStatus(int seq) {
		return sqlSession.update("eventStatus", seq);
	}

}
