package com.bkc.admin.board.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.store.service.AdminStoreService;
import com.bkc.event.vo.StoreVO;

@Controller
public class AdminStoreController {

	@Autowired
	private AdminStoreService adStoreService;

	// 게시판 목록보기
	@RequestMapping(value = "/admin/storelist.ad", method = RequestMethod.GET)
	private String getAdStoreList(Model model) {

		StoreVO store = new StoreVO();
		List<StoreVO> adStoreList = adStoreService.getAdStoreList(store);

		model.addAttribute("adStoreList", adStoreList);
		return "admin/subpages/store/storelist";
	}

	// 게시판 상세보기
	@RequestMapping(value = "/admin/getStore.ad")
	private String getAdStore(String store_name, Model model) {

		StoreVO vo = adStoreService.getAdStore(store_name);
		model.addAttribute("store", vo);
		return "admin/subpages/store/getStore";
	}

	// 신규매장 생성화면
	@RequestMapping(value = "/admin/insertStore.ad")
	public String insertStore(Model model) {
		return "admin/subpages/store/insertStore";
	}

	// 신규매장 생성
	@RequestMapping(value = "/admin/insertStoreDB.ad", method = { RequestMethod.POST })
	private String insertStoreDB(StoreVO store) {
		int result1 = adStoreService.adinsertStore(store);
		if (result1 == 1) {
			System.out.println("등록 성공");
		} else {
			System.out.println("실패");
		}
		return "redirect:/admin/storelist.ad";
	}

	// 신규매장 수정화면
	@RequestMapping(value = "/admin/updateStore.ad")
	private String updateStore(String store_name, Model model) {

		StoreVO vo = adStoreService.getAdStore(store_name);
		System.out.println(vo);
		model.addAttribute("store", vo);
		return "admin/subpages/store/updateStore";
	}

	// 신규매장 수정
	@RequestMapping(value = "/admin/updateStoreDB.ad", method = { RequestMethod.POST })
	private String updateStoreDB(StoreVO store, Model model) {
		int result2 = adStoreService.adupdateStore(store);
		System.out.println(store);
		StoreVO vo = adStoreService.getAdStore(store.getStore_name());
		System.out.println(vo);
		model.addAttribute("store", vo);
		if (result2 == 1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("실패");
		}	return "redirect:/admin/storelist.ad";
		
	}

	// 신규매장 이벤트 상태 변경
	@RequestMapping(value = "/admin/newStatus.ad", method = RequestMethod.GET)
	public String newStatus(Model model, @RequestParam("store_name") String store_name) {
		if (adStoreService.newStatus(store_name) == 1) {
			System.out.println("이벤트 상태 변경 완료");
		} else {
			System.out.println("이벤트 상태 변경 실패 ");
		}
		return "redirect:/admin/storelist.ad";
	}

	// 신규매장 삭제
	@RequestMapping(value = "/admin/deleteStoreDB.ad", method = { RequestMethod.GET, RequestMethod.POST })
	private String deleteStoreDB(Model model, @RequestParam("store_name") String store_name) {
		if (adStoreService.deleteStore(store_name) == 1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("실패");
		}
		return "redirect:/admin/storelist.ad";
	}

}
