package com.bkc.subpages.brand.bkcstory.controller;

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

import com.bkc.admin.aws.AwsS3;
import com.bkc.admin.board.banner.vo.BannerVO;
import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.customerService.vo.FaqVO;
import com.bkc.subpages.brand.bkcstory.service.AboutbkcService;
import com.bkc.subpages.brand.bkcstory.service.HistoryService;
import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;
import com.bkc.subpages.brand.whybkc.vo.ContributionVO;


@Controller
public class BkcstoryController {
	
	@Autowired
	private AboutbkcService aservice;
	
	@Autowired
	private HistoryService hservice;
	
	public AwsS3 awss3 = AwsS3.getInstance();
	
	//aboutBKC
	@RequestMapping(value = "/brand/brandStory.do", method = RequestMethod.GET)
	public String BkcstoryList(AboutbkcVO aboutbkcVO, HistoryVO historyVO, Model model) {
		
		List<AboutbkcVO> AboutbkcList = aservice.AboutbkcList(aboutbkcVO);
		List<HistoryVO> HistoryList = hservice.HistoryList(historyVO);
		
		model.addAttribute("HistoryVO", historyVO);
		model.addAttribute("HistoryList", HistoryList);
		model.addAttribute("AboutbkcVO", aboutbkcVO);
		model.addAttribute("AboutbkcList", AboutbkcList);
		
		System.out.println("Story 페이지 실행");
		return "subpages/brand/story";
	}
	
	//admin
	@RequestMapping(value = "/admin/bkcstorylist.ad", method = {RequestMethod.GET})
	public String AdminBkcstoryList(AboutbkcVO aboutbkcVO, HistoryVO historyVO, Model model) {
		
		List<AboutbkcVO> AboutbkcList = aservice.AboutbkcList(aboutbkcVO);
		List<HistoryVO> HistoryList = hservice.HistoryList(historyVO);
		
		model.addAttribute("HistoryVO", historyVO);
		model.addAttribute("HistoryList", HistoryList);
		model.addAttribute("AboutbkcVO", aboutbkcVO);
		model.addAttribute("AboutbkcList", AboutbkcList);
		
		return "admin/subpages/brand/bkcstorylist";
	}
	//history수정화면출력
	@RequestMapping(value = "/admin/historyDetail.ad", method = RequestMethod.GET)
	public String showhistory(Model model, @RequestParam("seq") int seq) {
		
		HistoryVO historyVO = hservice.getHistory(seq);
		model.addAttribute("historyVO", historyVO);
		
		return "admin/subpages/brand/historyContent";
	}
	
	//history수정
	@RequestMapping(value = "/admin/modifyhistory.ad", method = {RequestMethod.GET, RequestMethod.POST })
	public String modifyhistory(Model model, @RequestParam("seq") int seq, @RequestParam("title") String title, @RequestParam("content") String content) {
		
		HistoryVO historyVO = hservice.getHistory(seq);
		historyVO.setSeq(seq);
		historyVO.setTitle(title);
		historyVO.setContent(content);
		
		hservice.updateHistory(historyVO);
		
		model.addAttribute("historyVO", historyVO);
		System.out.println("test :" + historyVO.toString());
		return "redirect:/admin/bkcstorylist.ad";
	}
	
	//history삭제
	@RequestMapping(value = "/admin/deleteHistory.ad", method = RequestMethod.GET)
	public String deleteHistory(Model model, @RequestParam("seq") int seq){
		
		hservice.deleteHistory(seq);
		System.out.println("삭제 완료");
		
		
		return "redirect:/admin/bkcstorylist.ad";
	}
	
	
	//화면 보내기
	
	//aboutbkc수정화면출력
	@RequestMapping(value = "/admin/aboutbkcDetail.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String showaboutbkc(Model model,  @RequestParam("seq") int seq) {
		
		AboutbkcVO aboutbkcVO = aservice.getAboutbkc(seq);
		model.addAttribute("aboutbkcVO", aboutbkcVO);
		System.out.println("dd");
		
		return "admin/subpages/brand/aboutbkcContent";
	}
	
	//수정
	@RequestMapping(value = "/admin/modifyAboutbkc.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyAboutbkc(
		Model model, @RequestParam MultipartFile img, @RequestParam String title,
		@RequestParam String content, @RequestParam int seq) throws IOException, PSQLException {

		// aws s3 파일 업로드 처리
		//  세팅
		AboutbkcVO vo = aservice.getAboutbkc(seq);
		vo.setContent(content);
		vo.setTitle(title);
		
		if(img.getOriginalFilename() == "") {
			aservice.updateAboutbkc(vo);	
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
			
			// S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
			String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/brandstory/" + key; 
			vo.setPath(filePath); // path 설정
			
			aservice.updateAboutbkc(vo);
		}
		
		return "redirect:/admin/bkcstorylist.ad";
	}
	
	//aboubkc삭제
	@RequestMapping(value = "/admin/deleteAboutbkc.ad", method = RequestMethod.GET)
	public String deleteAboutbkc(Model model, @RequestParam("seq") int seq){
		
		AboutbkcVO aboutbkcVO = aservice.getAboutbkc(seq);
		
		aservice.deleteAboutbkc(seq);
		System.out.println("삭제 완료");
		
		int index = aboutbkcVO.getPath().indexOf("/", 20); // 자르기
		String key = aboutbkcVO.getPath().substring(index + 1); // 실제 경로
		System.out.println(key);
		
		// key위치에 있는 이미지 삭제
		awss3.delete(key); // AWS삭제
		
		return "redirect:/admin/bkcstorylist.ad";
	}
}
