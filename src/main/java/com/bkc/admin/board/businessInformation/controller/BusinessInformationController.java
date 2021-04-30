package com.bkc.admin.board.businessInformation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;

@Controller
public class BusinessInformationController {

	@Autowired
	private BusinessInformationService biService;

	// 사업자정보 조회페이지로 이동
	@RequestMapping(value = "/admin/businessinformationConent.ad", method = RequestMethod.GET)
	public String businessinformationPage(Model model) {

		// 푸터 추가
		int seq = 1;
		BusinessInformationVO bi = biService.getBusinessInformation(seq);
		model.addAttribute("bi", bi);
		return "admin/subpages/footer/businessInformationContent";
	}

	// 사업자정보 수정페이지로 이동
	@RequestMapping(value = "/admin/businessinformationUpdate.ad", method = RequestMethod.GET)
	public String businessinformationUpdatePage(Model model) {
		// 푸터 추가
		int seq = 1;
		BusinessInformationVO bi = biService.getBusinessInformation(seq);
		model.addAttribute("bi", bi);

		return "admin/subpages/footer/businessInformationUpdate";
	}

	// 사업자정보 실제 수정 실행
	@RequestMapping(value = "/admin/businessinformationUpdatelogic.ad", method = RequestMethod.POST)
	public String businessinformationUpdate(Model model, @RequestParam String address, @RequestParam String tel,
			@RequestParam String business_num, @RequestParam String copyright, @RequestParam String ceo_name) {

		BusinessInformationVO vo = new BusinessInformationVO();
		vo.setAddress(address);
		vo.setTel(tel);
		vo.setBusiness_num(business_num);
		vo.setCopyright(copyright);
		vo.setCeo_name(ceo_name);

		System.out.println(vo.toString());
		if (biService.updateBusinessInformation(vo) == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}

		return "redirect:/admin/businessinformationConent.ad";
	}

}
