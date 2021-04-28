package com.bkc.event.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.event.vo.EventVO;
import com.bkc.event.vo.StoreVO;

@Service
public interface EventService {
	
	//게시글 조회
	public List<EventVO> getEventList(EventVO event);
		
	//게시글 상세조회
	public EventVO getEvent(EventVO event);
	
	//진행중 이벤트 조회
	public List<EventVO> getEventConList(EventVO event);
	
	//종료 이벤트 조회
	public List<EventVO> getEventEndList(EventVO event);
	
	//신규매장 이벤트 조회
	public List<StoreVO> getStoreNewList(StoreVO store);
	
	//신규매장 이벤트 상세조회
	public StoreVO getStore(StoreVO store);
}
