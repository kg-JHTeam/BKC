package com.bkc.subpages.brand.whybkc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bkc.subpages.brand.whybkc.service.ContributionService;
import com.bkc.subpages.brand.whybkc.service.MaterialService;
import com.bkc.subpages.brand.whybkc.service.RealchickenService;
import com.bkc.subpages.brand.whybkc.vo.ContributionVO;
import com.bkc.subpages.brand.whybkc.vo.MaterialVO;
import com.bkc.subpages.brand.whybkc.vo.RealchickenVO;

@Controller
public class WhybkcController {
	
	@Autowired
	private RealchickenService chickenservice;
	
	@Autowired
	private MaterialService materialservice;
	
	@Autowired
	private ContributionService contributionService;
	
	//홈페이지 화면
	@RequestMapping(value = "/brand/whybkc.do", method = RequestMethod.GET)
	public String WhybkcList(RealchickenVO realchickenVO, ContributionVO Contributionvo, MaterialVO materialVO, Model model) {
		
		List<RealchickenVO> RealchickenList = chickenservice.RealchickenList(realchickenVO);
		List<MaterialVO> MaterialList = materialservice.MaterialList(materialVO);
		List<ContributionVO> ContributionList = contributionService.ContributionList(Contributionvo);
		
		model.addAttribute("RealchickenVO", realchickenVO);
		model.addAttribute("RealchickenList", RealchickenList);
		model.addAttribute("MaterialVO", materialVO);
		model.addAttribute("MaterialList", MaterialList);
		model.addAttribute("MaterialVO", materialVO);
		model.addAttribute("ContributionList", ContributionList);
		
		System.out.println("Story 페이지 실행");
		return "subpages/brand/whybkc";
	}
}
