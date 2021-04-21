package com.bkc.youtube.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.aws.AwsS3;
import com.bkc.youtube.service.YoutubeService;
import com.bkc.youtube.vo.YoutubeVO;

@Controller
public class YoutubeController {

	@Autowired
	private YoutubeService ytService;

	public AwsS3 awss3 = AwsS3.getInstance();

	// 배너 리스트 출력.
	@RequestMapping(value = "/admin/youtubeList.ad", method = RequestMethod.GET)
	public String showYoutubeList(Model model) {
		System.out.println("test ");
		List<YoutubeVO> youtubes = ytService.getYoutubeList();
		model.addAttribute("youtubes", youtubes);
		System.out.println("dd" + youtubes.toString());
		return "admin/subpages/youtube/youtubeList";
	}

	// 배너 상세 출력
	@RequestMapping(value = "/admin/youtubeContent.ad", method = RequestMethod.GET)
	public String showYoutube(Model model, @RequestParam("seq") int seq) {
		YoutubeVO youtubes = ytService.getYoutubeBySeq(seq);
		System.out.println("seq : " + seq);
		System.out.println("Youtube : " + youtubes.toString());
		model.addAttribute("Youtube", youtubes);
		return "admin/subpages/youtube/youtubeContent";
	}
	
	

	// 배너 등록 페이지 이동.
	@RequestMapping(value = "/admin/youtubeUploadpage.ad",  method = {RequestMethod.GET})
	public String insertYoutube() {
		return "admin/subpages/youtube/youtubeUploadpage";
	}

	// 배너 수정
	@RequestMapping(value = "/admin/modifyYoutube.ad", method = RequestMethod.POST)
	public String modifyYoutube(Model model, @RequestParam("seq") int seq) {
		YoutubeVO youtubes = ytService.getYoutubeBySeq(seq);
		
		System.out.println("seq : " + seq);
		System.out.println("youtube : " + youtubes.toString());
		model.addAttribute("youtube", youtubes);

		return "admin/subpages/youtube/youtubeContent";
	}

	// 배너 사용 | 미사용 변경
	@RequestMapping(value = "/admin/changeStatusYoutube.ad", method = RequestMethod.GET)
	public String changeStatusYoutube(Model model, @RequestParam("img_seq") int img_seq){
			if(ytService.changeStatusYoutube(img_seq)==1) {
				System.out.println(ytService.changeStatusYoutube(img_seq));
				System.out.println("배너 변경 완료");
			} else {
				System.out.println(ytService.changeStatusYoutube(img_seq));
				System.out.println("배너 변경 실패 ");
			}
		return "redirect:/admin/youtubeList.ad";
	}
	
	//배너 삭제
	@RequestMapping(value = "/admin/deleteYoutube.ad", method = RequestMethod.GET)
	public String deleteYoutube(Model model,
			@RequestParam("img_seq") int img_seq){
		
		//DB에서 삭제
		if(ytService.deleteYoutube(img_seq)==1) {
			System.out.println("배너 삭제 완료");
		} else {
			System.out.println("배너 삭제 실패 ");
		}
		
		System.out.println("삭제 완료");
		
		return "redirect:/admin/ytlist.ad";
	}
}
