package com.bkc.menuInform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.menuInform.vo.ProductVO;

@Controller
@RequestMapping(value = "/menuInform", method = RequestMethod.GET)
public class MenuInformController {

	@Autowired
	private ProductService productService;

	@Autowired
	private BusinessInformationService biService;

	// 치킨메뉴 게시글 목록 조회
	@RequestMapping(value = "/chickenMenu.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getChickenMenuList(Model model) {
		List<ProductVO> chickenMenuList = productService.getChickenMenuList();
		model.addAttribute("chickenMenuList", chickenMenuList);
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/menuInform/chickenMenu";
	}

	// 치킨메뉴 디테일
	@RequestMapping(value = "/chickenmenudetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chickenmenudetail(@RequestParam int product_serial, Model model) {
		// 상세조회
		ProductVO chickenMenu = productService.getChickenMenu(product_serial);
		model.addAttribute("chickenMenu", chickenMenu);
		// 밑에부분 사이드메뉴 관련
		List<ProductVO> chickenMenuList = productService.getChickenMenuList();
		model.addAttribute("chickenMenuList", chickenMenuList);

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/menuInform/chickenmenudetail";
	}

	// 비어존 리스트
	@RequestMapping(value = "/beerZone.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String getBeerzoneList(Model model) {
		List<ProductVO> beerzoneList = productService.getBeerzoneList();
		model.addAttribute("beerzoneList", beerzoneList);
		return "subpages/menuInform/beerZone";

	}

	// 비어존 디테일
	@RequestMapping(value = "/beerzonedetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String beerZoneDetail(@RequestParam int product_serial, Model model) {
		// 상세조회
		ProductVO beerzone = productService.getBeerzone(product_serial);
		model.addAttribute("beerzone", beerzone);
		// 밑에부분 사이드메뉴 관련
		List<ProductVO> beerzoneList = productService.getBeerzoneList();
		model.addAttribute("beerzoneList", beerzoneList);

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/menuInform/beerzonedetail";
	}

	// 사이드 목록 조회 bkc/menuInform/sideMenu.do
	@RequestMapping(value = "/sideMenu.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String getSidemenuList(Model model) {
		List<ProductVO> sidemenuList = productService.getSidemenuList();
		model.addAttribute("sidemenuList", sidemenuList);

		return "subpages/menuInform/sideMenu";
	}

	// 사이드 디테일
	@RequestMapping(value = "/sidemenudetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sidemenudetail(@RequestParam int product_serial, Model model) {
		// 상세조회
		ProductVO sidemenu = productService.getSidemenu(product_serial);
		model.addAttribute("sidemenu", sidemenu);

		// 밑에부분 사이드메뉴 관련
		List<ProductVO> sidemenuList = productService.getSidemenuList();
		model.addAttribute("sidemenuList", sidemenuList);

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/menuInform/sidemenudetail";
	}

	// 신메뉴 리스트 조회
	@RequestMapping(value = "/newMenu.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String getNewmenuList(Model model) {
		List<ProductVO> newmenuList = productService.getNewmenuList();
		model.addAttribute("newmenuList", newmenuList);

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/menuInform/newMenu";
	}

	// 신 디테일
	@RequestMapping(value = "/newmenudetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String newmenudetail(@RequestParam int product_serial, Model model) {
		// 상세조회
		ProductVO newmenu = productService.getNewmenu(product_serial);
		model.addAttribute("newmenu", newmenu);

		// 밑에부분 신메뉴 관련
		List<ProductVO> newmenuList = productService.getNewmenuList();
		model.addAttribute("newmenuList", newmenuList);

		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "subpages/menuInform/newmenudetail";
	}
}
