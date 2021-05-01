package com.bkc.admin.board.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bkc.admin.aws.AwsS3;
import com.bkc.admin.board.event.service.AdminEventService;
import com.bkc.event.vo.EventVO;

@Controller
public class AdminEventController {
	
	@Autowired
	private AdminEventService adEventService;
	private AwsS3 awss3 = AwsS3.getInstance();
	
	//이벤트 목록보기
	@RequestMapping(value="/admin/eventlist.ad", method=RequestMethod.GET)
	private String getAdEventList(EventVO event, Model model) {
		List<EventVO> adEventList = adEventService.getAdEventList(event);
		model.addAttribute("adEventList", adEventList);
		System.out.println(adEventList);
		return "admin/subpages/event/eventlist";
	}
	
	//이벤트 상세보기
	@RequestMapping(value="/admin/getEvent.ad")	
	private String getAdEvent(int seq, Model model) {
		EventVO vo = adEventService.getAdEvent(seq);
		model.addAttribute("event", vo);
		return "admin/subpages/event/getEvent";
	}
	
	//이벤트 생성화면
	@RequestMapping(value="/admin/insertEvent.ad")
	public String insertEvent(Model model) {
		return  "admin/subpages/event/insertEvent";
	}
	
	//이벤트 생성
	@RequestMapping(value="/admin/insertEventDB.ad",  method ={ RequestMethod.POST })
	private String insertEventDB(EventVO event) {
		int result = adEventService.insertEvent(event);
		if(result == 1) {
			System.out.println("등록 성공");
		}else {
			System.out.println("실패");
		}
		return "redirect:/admin/eventlist.ad";
	}
	
	//이벤트 수정화면
	@RequestMapping(value="/admin/updateEvent.ad")
	private String updateEvent(int seq, Model model) {
		
		EventVO vo = adEventService.getAdEvent(seq);
		model.addAttribute("event", vo);
		return "admin/subpages/event/updateEvent";
	}
	
	//이벤트 수정
	@RequestMapping(value="/admin/updateEventDB.ad", method ={RequestMethod.POST })
	private String updateEventDB(EventVO event) {
		int result = adEventService.updateEvent(event);	
		if(result == 1) {
			
			System.out.println("수정 성공");
			return "redirect:/admin/eventlist.ad";
		}
		System.out.println("수정 실패");
		return "redirect:/admin/getEvent.ad";
	}
	
	//이벤트 삭제
	@RequestMapping(value="/admin/deleteEventDB.ad", method={RequestMethod.GET})
	private String deleteEventDB( @RequestParam("seq") int seq) {
		
		EventVO evo = adEventService.getAdEvent(seq);
		
		String deleteImgTit=evo.getImg_title();
		String deleteImg = evo.getImage();
		
		int result = adEventService.deleteEvent(evo);
		if(result == 1) {			
			awss3.delete(deleteImgTit); // AWS삭제
			awss3.delete(deleteImg);
			return "redirect:/admin/eventlist.ad";
		}
		
		System.out.println("삭제 실패");
		return "redirect:/admin/getEvent.ad";
		
	}
	
	//이벤트 상태 변경
		@RequestMapping(value = "/admin/eventStatus.ad", method = RequestMethod.GET)
		public String eventStatus(Model model, @RequestParam("seq") int seq) {
			if (adEventService.eventStatus(seq) == 1) {
				System.out.println("이벤트 상태 변경 완료");
			} else {
				System.out.println("이벤트 상태 변경 실패 ");
			}
			return "redirect:/admin/eventlist.ad";
		}
}
