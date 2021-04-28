package com.bkc.admin.board.event.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.event.vo.EventVO;

@Service
public interface AdminEventService {

	// 이벤트 조회
	public List<EventVO> getAdEventList(EventVO event);

	// 이벤트 상세조회
	public EventVO getAdEvent(int seq);

	// 이벤트 등록
	public int insertEvent(EventVO event);

	// 이벤트 수정
	public int updateEvent(EventVO event);

	// 이벤트 삭제
	public int deleteEvent(EventVO event);

	// 이벤트 상태 변경
	public int eventStatus(int seq);
}
