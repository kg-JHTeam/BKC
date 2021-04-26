package com.bkc.youtube.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.customerService.vo.FaqVO;
import com.bkc.youtube.service.YoutubeService;
import com.bkc.youtube.vo.YoutubeVO;

@Controller
public class YoutubeController {

	@Autowired
	private YoutubeService ytService;

	// 유튜브 리스트 출력.
	@RequestMapping(value = "/admin/youtubeList.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String showYoutubeList(Model model) {
		List<YoutubeVO> youtubes = ytService.getYoutubeList();
		model.addAttribute("youtubes", youtubes);

		return "admin/subpages/youtube/youtubeList";
	}

	// 유튜브 상세 출력
	@RequestMapping(value = "/admin/youtubeContent.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String showYoutube(Model model, @RequestParam("img_seq") int img_seq) {
		YoutubeVO youtube = ytService.getYoutubeBySeq(img_seq);
		model.addAttribute("youtube", youtube);

		System.out.println(youtube.toString());
		return "admin/subpages/youtube/youtubeContent";
	}

	// 배너 등록 페이지 이동.
	@RequestMapping(value = "/admin/youtubeUploadpage.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String youtubeUploadpage() {
		return "admin/subpages/youtube/youtubeUploadpage";
	}

	// 유튜브 등록 페이지 이동.
	@RequestMapping(value = "/admin/insertYoutube.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertYoutube(Model model, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("path") String path,
			@RequestParam(value = "use_status", required = false) boolean use_status) {

		YoutubeVO youtubeVO = new YoutubeVO();

		youtubeVO.setContent(content);
		youtubeVO.setTitle(title);
		youtubeVO.setPath(path);
		youtubeVO.setUse_status(use_status);

		// Date insert 현재 시간 등록
		Date date = new Date(System.currentTimeMillis());
		youtubeVO.setDate(date);

		CheckVO check = new CheckVO();

		if (ytService.insertYoutube(youtubeVO) == 1) {
			System.out.println("유튜브 생성 완료");
			check.setSuccess("true");
		} else {
			System.out.println("유튜브 생성 실패 ");
			check.setSuccess("false");
		}
		model.addAttribute("check", check);
		return "redirect:/admin/youtubeList.ad";
	}

	@RequestMapping(value = "/admin/modifyYoutube.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyYoutube(Model model, @RequestParam("img_seq") int img_seq, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("path") String path) {

		YoutubeVO vo = ytService.getYoutubeBySeq(img_seq);
		vo.setContent(content);
		vo.setTitle(title);
		vo.setPath(path);
		CheckVO check = new CheckVO();

		if (ytService.updateYoutube(vo) == 1) {
			System.out.println("유튜브 수정 완료");
			check.setSuccess("true");
		} else {
			System.out.println("유튜브 수정 실패 ");
			check.setSuccess("false");
		}
		model.addAttribute("check", check);
		return "admin/subpages/youtube/youtubeContent";
	}

	@RequestMapping(value = "/admin/changeStatusYoutube.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String changeStatusYoutube(Model model, @RequestParam("img_seq") int img_seq) {

		// 1. 먼저 기존 값이 뭔지 찾아온다.
		YoutubeVO vo = ytService.getYoutubeBySeq(img_seq);

		// 2.1) 가져온 값이 사용중인 경우
		if (vo.getUse_status() == true) {
			if (ytService.changeStatusYoutube(img_seq) == 1) {
				System.out.println("유튜브 미사용중으로 변경 완료");
			} else {
				System.out.println("유튜브 미사용중으로 변경 실패");
			}
		}

		// 2.2) 가져온 값이 본인 제외 모두 미사용중으로 변경
		else if (vo.getUse_status() == false) {
			// 2.2.1)가져온 값은 사용중으로 변경
			if (ytService.changeStatusYoutube(img_seq) == 1) {
				System.out.println("유튜브 사용중으로 변경 완료");
			} else {
				System.out.println("유튜브 사용중으로 변경 실패");
			}

			// 2.2.2) 가져온 값을 제외한 모든 값은 미사용중으로 변경
			ytService.changeAllStatusYoutube(img_seq);
		}
		return "redirect:/admin/youtubeList.ad";
	}

	// 유튜브 삭제
	@RequestMapping(value = "/admin/deleteYoutube.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteYoutube(Model model, @RequestParam("img_seq") int img_seq) {

		// DB에서 삭제
		if (ytService.deleteYoutube(img_seq) == 1) {
			System.out.println("배너 삭제 완료");
		} else {
			System.out.println("배너 삭제 실패 ");
		}

		System.out.println("삭제 완료");

		return "redirect:/admin/youtubeList.ad";
	}
}
