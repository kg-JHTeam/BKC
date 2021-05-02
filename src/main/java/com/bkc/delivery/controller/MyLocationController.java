package com.bkc.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.delivery.service.MyLocationService;
import com.bkc.delivery.vo.MyLocationVO;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
public class MyLocationController {

	@Autowired
	private MyLocationService mylocaService;

	@Autowired
	private UserService userService;

	@Autowired
	private BusinessInformationService biService;
	
	// 배달지 목록보기
	@RequestMapping(value = "/delivery/mylocation.do")
	private String getLocaList(MyLocationVO loca, Model model) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());

		List<MyLocationVO> newlist = mylocaService.newLocaList(user.getUserid());
		model.addAttribute("newlist", newlist);
		model.addAttribute("user", user);

		MyLocationVO location = mylocaService.getLocaOne(user.getUserid());
		System.out.println(location);
		model.addAttribute("location", location);

		List<MyLocationVO> localist = mylocaService.getLocaList(user.getUserid());
		model.addAttribute("localist", localist);
		model.addAttribute("user", user);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "delivery/mylocation";
	}

	// 현재 등록된 배달지 개수 가져오기
	@RequestMapping(value = "/delivery/getCountLoca.do", method = RequestMethod.GET)
	private String getCountLoca(Model model) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		
		int countloca = mylocaService.getCountLoca(user.getUserid());
		System.out.println(countloca);
		return "delivery/mylocation";
	}

	// 배달지 등록
	@RequestMapping(value = "/delivery/insertLocaDB.do")
	public String insertLocaDB(Model model, MyLocationVO loca) {

		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());
		int countloca = mylocaService.getCountLoca(user.getUserid());

		if (countloca < 6) {
			int result = mylocaService.insertLoca(loca);
			if (result == 1) {
				System.out.println("배달지 등록 성공");
			} else {
				System.out.println("실패");
			}
		} else {
			System.out.println("배달지 5개 초과");
		}
		
		return "redirect:/delivery/mylocation.do";
	}

	// 지정 배달지 등록
	@RequestMapping(value = "/delivery/insertOneDB.do")
	public String insertLocaOneDB(Model model, MyLocationVO loca) {

		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());

		int countloca = mylocaService.getCountLoca(user.getUserid());

		if (countloca < 1) {
			int result = mylocaService.insertLocaOne(loca);
			if (result == 1) {
				System.out.println("배달지 등록 성공");
			} else {
				System.out.println("실패");
			}
		} else {
			int result = mylocaService.updateLocaOne(loca);
			if (result == 1) {
				System.out.println("배달지 변경 성공");
			} else {
				System.out.println("실패");
			}
		}
		return "redirect:/delivery/delivery.do";
	}
	
	//주문페이지에서 배달지 변경 
	@RequestMapping(value = "/delivery/insertLocation.do")
	public String insertLocation(Model model, MyLocationVO loca) {

		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());

		int countloca = mylocaService.getCountLoca(user.getUserid());

		if (countloca < 1) {
			int result = mylocaService.insertLocaOne(loca);
			if (result == 1) {
				System.out.println("배달지 등록 성공");
			} else {
				System.out.println("실패");
			}
		} else {
			int result = mylocaService.updateLocaOne(loca);
			if (result == 1) {
				System.out.println("배달지 변경 성공");
			} else {
				System.out.println("실패");
			}
		}
		return "redirect:/delivery/order.do";
	}	
		

	// 배달지 삭제
	@RequestMapping(value = "/delivery/deleteLocaDB.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String deleteLocaDB(int addr_seq) {
		if (mylocaService.deleteLoca(addr_seq) == 1) {
			System.out.println("삭제 성공");
			return "redirect:/delivery/mylocation.do";
		} else {
			System.out.println("실패");
		}
		return "redirect:/delivery/mylocation.do";
	}

}
