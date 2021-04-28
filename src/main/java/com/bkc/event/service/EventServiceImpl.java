package com.bkc.event.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bkc.event.dao.EventDAO;
import com.bkc.event.vo.EventVO;
import com.bkc.event.vo.StoreVO;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO eventDao;	
	
	@Override
	public List<EventVO> getEventList(EventVO event) {
		return eventDao.getEventList(event);
	}

	@Override
	public EventVO getEvent(EventVO event) {
		return eventDao.getEvent(event);
	}

	@Override
	public List<EventVO> getEventConList(EventVO event) {
		return eventDao.getEventConList(event);
	}

	@Override
	public List<EventVO> getEventEndList(EventVO event) {
		return eventDao.getEventEndList(event);
	}

	@Override
	public List<StoreVO> getStoreNewList(StoreVO store) {
		return eventDao.getStoreNewList(store);
	}

	@Override
	public StoreVO getStore(StoreVO store) {
		return eventDao.getStore(store);
	}

	

	
	
}
