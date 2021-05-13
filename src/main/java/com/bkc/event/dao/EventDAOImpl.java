package com.bkc.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.event.vo.EventVO;
import com.bkc.event.vo.StoreVO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSession sqlSession;

	//이벤트 목록 조회
	@Override
	public List<EventVO> getEventList(EventVO event) {
		System.out.println("getEventList() 수행");
		return sqlSession.selectList("getEventList");
	}

	//이벤트 상세 조회
	@Override
	public EventVO getEvent(EventVO event) {
		System.out.println("getEvent() 수행");
		return sqlSession.selectOne("getEvent", event);
	}

	@Override
	public List<EventVO> getEventConList(EventVO event) {
		return sqlSession.selectList("getEventConList", event);
	}

	@Override
	public List<EventVO> getEventEndList(EventVO event) {
		return sqlSession.selectList("getEventEndList", event);
	}

	@Override
	public List<StoreVO> getStoreNewList(StoreVO store) {
		return sqlSession.selectList("getStoreNewList", store);
	}

	@Override
	public StoreVO getStore(StoreVO store) {
		return sqlSession.selectOne("getStore", store);
	}
	
	
	
	

}
