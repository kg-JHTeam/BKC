package com.bkc.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.event.service.EventService;
import com.bkc.event.vo.EventVO;
import com.bkc.event.vo.StoreVO;

@Controller
public class EventController {
	@Autowired
	private BusinessInformationService biService;

	@Autowired
	private EventService eventService;

	// 이벤트 목록보기
	@RequestMapping(value = "/event/eventPageAll.do", method = RequestMethod.GET)
	private String getEventList(EventVO event, Model model) {

		List<EventVO> eventList = eventService.getEventList(event);
		model.addAttribute("eventList", eventList);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/event/eventPageAll";
	}

	// 이벤트 상세 조회
	@RequestMapping(value = "/event/eventDetail.do", method = RequestMethod.GET)
	private String getEvent(EventVO event, Model model) {

		EventVO vo = eventService.getEvent(event);
		model.addAttribute("event", vo);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/event/eventDetail";
	}

	// 진행중 이벤트 조회
	@RequestMapping(value = "/event/eventPageContinue.do", method = RequestMethod.GET)
	private String getEventConList(EventVO event, Model model) {

		List<EventVO> eventConList = eventService.getEventConList(event);
		model.addAttribute("eventConList", eventConList);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "subpages/event/eventPageContinue";
	}

	// 종료 이벤트 조회
	@RequestMapping(value = "/event/eventPageEnd.do", method = RequestMethod.GET)
	private String getEventEndList(EventVO event, Model model) {

		List<EventVO> eventEndList = eventService.getEventEndList(event);
		model.addAttribute("eventEndList", eventEndList);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/event/eventPageEnd";
	}

	// 신규매장 이벤트 조회
	@RequestMapping(value = "/event/eventPageNew.do", method = RequestMethod.GET)
	private String getStoreNewList(StoreVO store, Model model) {

		System.out.println("신규 조회 수행");
		List<StoreVO> storeNewList = eventService.getStoreNewList(store);
		model.addAttribute("storeNewList", storeNewList);
		return "subpages/event/eventPageNew";
	}

	// 신규매장 이벤트 상세 조회
	@RequestMapping(value = "/event/eventNewDetail.do")
	private String getStore(StoreVO store, Model model) {

		StoreVO svo = eventService.getStore(store);
		model.addAttribute("store", svo);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "subpages/event/eventNewDetail";
	}

}
