package com.bkc.subpages.brand.bkcnews.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.menuInform.vo.ProductVO;

@Controller
public class BkcnewsController {

	@Autowired
	private ProductService productService;

	@Autowired
	private BusinessInformationService biService;
	
	@RequestMapping(value = "/brand/newsNewItem.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String BkcnewsList(Model model) {
		// 푸터 넣기
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		List<ProductVO> newmenuList = productService.getNewmenuList();
		model.addAttribute("newmenuList", newmenuList);
		System.out.println("Story 페이지 실행");
		return "subpages/brand/newsNewItem";
	}

}
