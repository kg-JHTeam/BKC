package com.bkc.subpages.brand.whybkc.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bkc.admin.aws.AwsS3;
import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;
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
	
	public AwsS3 awss3 = AwsS3.getInstance();
	
	//홈페이지 화면
	@RequestMapping(value = "/brand/whybkc.do", method = RequestMethod.GET)
	public String WhybkcList(RealchickenVO realchickenVO, ContributionVO contributionVO, MaterialVO materialVO, Model model) {
		
		List<RealchickenVO> RealchickenList = chickenservice.RealchickenList(realchickenVO);
		List<MaterialVO> MaterialList = materialservice.MaterialList(materialVO);
		List<ContributionVO> ContributionList = contributionService.ContributionList(contributionVO);
		
		model.addAttribute("RealchickenVO", realchickenVO);
		model.addAttribute("RealchickenList", RealchickenList);
		model.addAttribute("MaterialVO", materialVO);
		model.addAttribute("MaterialList", MaterialList);
		model.addAttribute("ContributionVO", contributionVO);
		model.addAttribute("ContributionList", ContributionList);
		
		System.out.println("Story 페이지 실행");
		return "subpages/brand/whybkc";
	}
	
	//admin
	@RequestMapping(value = "/admin/whybkclist.ad", method = RequestMethod.GET)
	public String AdminWhybkcList(RealchickenVO realchickenVO, ContributionVO contributionVO, MaterialVO materialVO, Model model) {
		
		List<RealchickenVO> RealchickenList = chickenservice.RealchickenList(realchickenVO);
		List<MaterialVO> MaterialList = materialservice.MaterialList(materialVO);
		List<ContributionVO> ContributionList = contributionService.ContributionList(contributionVO);
		
		model.addAttribute("RealchickenVO", realchickenVO);
		model.addAttribute("RealchickenList", RealchickenList);
		model.addAttribute("MaterialVO", materialVO);
		model.addAttribute("MaterialList", MaterialList);
		model.addAttribute("ContributionVO", contributionVO);
		model.addAttribute("ContributionList", ContributionList);
		
		System.out.println("Story 페이지 실행");
		return "admin/subpages/brand/whybkclist";
	}
	
	//realchicken수정화면
	@RequestMapping(value = "/admin/realchickenDetail.ad", method = RequestMethod.GET)
	public String showrealchicken(Model model, @RequestParam("seq") int seq) {
		
		RealchickenVO realchickenVO = chickenservice.getRealchicken(seq);
		model.addAttribute("RealchickenVO", realchickenVO);
		
		return "admin/subpages/brand/realchickenContent";
	}
	
	//realchicken삭제
	@RequestMapping(value = "/admin/deleteRealchicken.ad", method = RequestMethod.GET)
	public String deleteRealchicken(Model model, @RequestParam("seq") int seq){
		
		RealchickenVO realchickenVO = chickenservice.getRealchicken(seq);
		
		chickenservice.deleteRealchicken(seq);
		System.out.println("삭제 완료");
		
		int index = realchickenVO.getPath().indexOf("/", 20); // 자르기
		String key = realchickenVO.getPath().substring(index + 1); // 실제 경로
		System.out.println(key);
		
		// key위치에 있는 이미지 삭제
		awss3.delete(key); // AWS삭제
		
		return "redirect:/admin/whybkclist.ad";
	}
	
	//realchicken수정완료
	@RequestMapping(value = "/admin/modifyRealchicken.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyRealchicken(Model model, @RequestParam MultipartFile img, @RequestParam String content, @RequestParam int seq) throws IOException, PSQLException {

		// aws s3 파일 업로드 처리
		//  세팅
		RealchickenVO vo = chickenservice.getRealchicken(seq);
		vo.setContent(content);
		
		if(img.getOriginalFilename() == "") {
			chickenservice.updateRealchicken(vo);
			
		}else {
			
			int index = vo.getPath().indexOf("/", 20); // 자르기
			String key = vo.getPath().substring(index + 1); // 실제 경로

			// key위치에 있는 이미지 삭제
			awss3.delete(key);
			
			InputStream is = img.getInputStream();
			key = img.getOriginalFilename();
			String contentType = img.getContentType();
			long contentLength = img.getSize();
			
			String bucket = "bkcbuc";
			String pathKey = "bkc_img/brandstory/" + key; // banner에 올리기
			awss3.upload(is, pathKey, contentType, contentLength, bucket);
			System.out.println(key);
			
			// S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
			String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/brandstory/" + key; 
			vo.setPath(filePath); // path 설정
			
			chickenservice.updateRealchicken(vo);
		}
		return "redirect:/admin/whybkclist.ad";
	}
	
	//material수정화면
	@RequestMapping(value = "/admin/materialDetail.ad", method = RequestMethod.GET)
	public String showmaterial(Model model, @RequestParam("seq") int seq) {
		
		MaterialVO materialVO = materialservice.getMaterial(seq);
		model.addAttribute("MaterialVO", materialVO);
		
		return "admin/subpages/brand/materialContent";
	}
	
	//material삭제
	@RequestMapping(value = "/admin/deleteMaterial.ad", method = RequestMethod.GET)
	public String deleteMaterial(Model model, @RequestParam("seq") int seq){
		
		MaterialVO materialVO = materialservice.getMaterial(seq);
		
		materialservice.deleteMaterial(seq);
		System.out.println("삭제 완료");
		
		int index = materialVO.getPath().indexOf("/", 20); // 자르기
		String key = materialVO.getPath().substring(index + 1); // 실제 경로
		System.out.println(key);
		
		// key위치에 있는 이미지 삭제
		awss3.delete(key); // AWS삭제
		
		return "redirect:/admin/whybkclist.ad";
	}
	//Material수정완료  이미지 업로드 2개
	@RequestMapping(value = "/admin/modifyMaterial.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyMaterial(@RequestParam MultipartFile img2, Model model, @RequestParam MultipartFile img, @RequestParam String content , @RequestParam int seq) throws IOException, PSQLException {

		// aws s3 파일 업로드 처리
		//  세팅
		MaterialVO vo = materialservice.getMaterial(seq);
		vo.setContent(content);
		
		if(img.getOriginalFilename() == "") {
			materialservice.updateMaterial(vo);
			
		}else {
			
			int index = vo.getPath().indexOf("/", 20); // 자르기
			String key = vo.getPath().substring(index + 1); // 실제 경로
			
			int index2 = vo.getPath_().indexOf("/", 20); // 자르기
			String key2 = vo.getPath_().substring(index2 + 1); // 실제 경로

			// key위치에 있는 이미지 삭제
			awss3.delete(key);
			awss3.delete(key2);
			
			InputStream is2 = img2.getInputStream();
			key2 = img2.getOriginalFilename();
			String contentType2 = img2.getContentType();
			long contentLength2 = img2.getSize();
			
			InputStream is = img.getInputStream();
			key = img.getOriginalFilename();
			String contentType = img.getContentType();
			long contentLength = img.getSize();
			
			String bucket = "bkcbuc";
			String pathKey = "bkc_img/brandstory/" + key; // banner에 올리기
			awss3.upload(is, pathKey, contentType, contentLength, bucket);
			
			String bucket2 = "bkcbuc";
			String pathKey2 = "bkc_img/brandstory/" + key2; // banner에 올리기
			awss3.upload(is2, pathKey2, contentType2, contentLength2, bucket2);
			
			// S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
			String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/brandstory/" + key; 
			vo.setPath(filePath); // path 설정
			
			String filePath2 = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/brandstory/" + key2; 
			vo.setPath_(filePath2); // path 설정
			
			materialservice.updateMaterial(vo);
		}
		return "redirect:/admin/whybkclist.ad";
	}
	
	//contribution수정화면
	@RequestMapping(value = "/admin/contributionDetail.ad", method = RequestMethod.GET)
	public String showcontribution(Model model, @RequestParam("seq") int seq) {
		
		ContributionVO contributionVO = contributionService.getContribution(seq);
		model.addAttribute("ContributionVO", contributionVO);
		
		return "admin/subpages/brand/contributionContent";
	}
	
	//contribution삭제
	@RequestMapping(value = "/admin/deleteContribution.ad", method = RequestMethod.GET)
	public String deleteContribution(Model model, @RequestParam("seq") int seq){
		
		ContributionVO contributionVO = contributionService.getContribution(seq);
		
		contributionService.deleteContribution(seq);
		System.out.println("삭제 완료");
		
		int index = contributionVO.getPath().indexOf("/", 20); // 자르기
		String key = contributionVO.getPath().substring(index + 1); // 실제 경로
		System.out.println(key);
		
		// key위치에 있는 이미지 삭제
		awss3.delete(key); // AWS삭제
		
		return "redirect:/admin/whybkclist.ad";
	}
	
	//Contribution수정완료
	@RequestMapping(value = "/admin/modifyContribution.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyContribution(Model model, @RequestParam MultipartFile img, @RequestParam String content, @RequestParam int seq) throws IOException, PSQLException {
		
		// aws s3 파일 업로드 처리
		//  세팅
		ContributionVO vo = contributionService.getContribution(seq);
		vo.setContent(content);
		
		if(img.getOriginalFilename() == "") {
			contributionService.updateContribution(vo);
			
		}else {
			
			int index = vo.getPath().indexOf("/", 20); // 자르기
			String key = vo.getPath().substring(index + 1); // 실제 경로

			// key위치에 있는 이미지 삭제
			awss3.delete(key);
			
			InputStream is = img.getInputStream();
			key = img.getOriginalFilename();
			String contentType = img.getContentType();
			long contentLength = img.getSize();
			
			String bucket = "bkcbuc";
			String pathKey = "bkc_img/brandstory/" + key; // banner에 올리기
			awss3.upload(is, pathKey, contentType, contentLength, bucket);
			System.out.println(key);
			
			// S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
			String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/brandstory/" + key; 
			vo.setPath(filePath); // path 설정
			
			contributionService.updateContribution(vo);
		}
		return "redirect:/admin/whybkclist.ad";
	}
}
