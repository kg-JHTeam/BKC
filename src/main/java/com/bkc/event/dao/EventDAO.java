package com.bkc.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.event.vo.EventVO;
import com.bkc.event.vo.StoreVO;

@Repository
public interface EventDAO {

	//게시글 조회
	public List<EventVO> getEventList(EventVO event);
	
	//게시글 상세조회
	public EventVO getEvent(EventVO event);
	
	//진행중 이벤트 조회
	public List<EventVO> getEventConList(EventVO event);
		
	//종료 이벤트 조회
	public List<EventVO> getEventEndList(EventVO event);
	
	//신규매장 이벤트 조회
	public List<StoreVO>getStoreNewList(StoreVO store);
	
	//신규매장 이벤트 상세조회
	public StoreVO getStore(StoreVO store);
}
