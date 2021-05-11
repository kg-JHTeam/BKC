package com.bkc.youtube.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.youtube.service.YoutubeService;
import com.bkc.youtube.vo.YoutubeVO;

@Controller
public class YoutubeController {

	@Autowired
	private YoutubeService ytService;

	@Autowired
	private BusinessInformationService biService;

	// Youtube 광고 리스트 (관리자) 출력
	@RequestMapping(value = "/admin/youtubeList.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String showYoutubeList(Model model) {
		List<YoutubeVO> youtubes = ytService.getYoutubeList();
		model.addAttribute("youtubes", youtubes);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);

		return "admin/subpages/youtube/youtubeList";
	}

	// Youtube 광고 리스트 (홈페이지) 출력
	@RequestMapping(value = "/brand/Advertising.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String showYoutubeHome(Model model, YoutubeVO youtubevo) {
		List<YoutubeVO> youtubeAd = ytService.getYoutubeHome(youtubevo);
		model.addAttribute("youtubeAd", youtubeAd);
		model.addAttribute("youtubevo", youtubevo);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "subpages/brand/Advertising";
	}

	// Youtube 광고 정보 상세 출력
	@RequestMapping(value = "/admin/youtubeContent.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String showYoutube(Model model, @RequestParam("img_seq") int img_seq) {
		YoutubeVO youtube = ytService.getYoutubeBySeq(img_seq);
		model.addAttribute("youtube", youtube);

		return "admin/subpages/youtube/youtubeContent";
	}

	// Youtube 광고 등록 페이지 이동
	@RequestMapping(value = "/admin/youtubeUploadpage.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String youtubeUploadpage() {
		return "admin/subpages/youtube/youtubeUploadpage";
	}

	// Youtube 광고 등록 기능
	@RequestMapping(value = "/admin/insertYoutube.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertYoutube(Model model, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("path") String path,
			@RequestParam("date") String date, @RequestParam("thumbnail") String thumbnail,
			@RequestParam(value = "use_status", required = false) boolean use_status) {

		YoutubeVO youtubeVO = new YoutubeVO();

		youtubeVO.setContent(content);
		youtubeVO.setTitle(title);
		youtubeVO.setPath(path);
		youtubeVO.setUse_status(use_status);
		youtubeVO.setThumbnail(thumbnail);

		youtubeVO.setDate(date);

		CheckVO check = new CheckVO();

		if (ytService.insertYoutube(youtubeVO) == 1) {
			System.out.println("Youtube 광고 등록 완료");
			check.setSuccess("true");
		} else {
			System.out.println("Youtube 광고 등록 실패 ");
			check.setSuccess("false");
		}
		model.addAttribute("check", check);
		return "redirect:/admin/youtubeList.ad";
	}

	// Youtube 광고 상세 정보 수정 기능
	@RequestMapping(value = "/admin/modifyYoutube.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyYoutube(Model model, @RequestParam("img_seq") int img_seq, @RequestParam("title") String title, @RequestParam("thumbnail") String thumbnail,
			@RequestParam("content") String content, @RequestParam("path") String path) {

		YoutubeVO vo = ytService.getYoutubeBySeq(img_seq);

		vo.setContent(content);
		vo.setTitle(title);
		vo.setPath(path);
		vo.setThumbnail(thumbnail);

		CheckVO check = new CheckVO();

		if (ytService.updateYoutube(vo) == 1) {
			System.out.println("Youtube 광고 수정 완료");
			check.setSuccess("true");
		} else {
			System.out.println("Youtube 광고 수정 실패 ");
			check.setSuccess("false");
		}
		model.addAttribute("check", check);
		return "admin/subpages/youtube/youtubeContent";
	}

	// Youtube 광고 사용/미사용 변경 기능
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

	// Youtube 광고 삭제 기능
	@RequestMapping(value = "/admin/deleteYoutube.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteYoutube(Model model, @RequestParam("img_seq") int img_seq) {
		// DB에서 삭제
		if (ytService.deleteYoutube(img_seq) == 1) {
			System.out.println("Youtube 광고 삭제 완료");
		} else {
			System.out.println("Youtube 광고 삭제 실패 ");
		}
		return "redirect:/admin/youtubeList.ad";
	}

	@ResponseBody
	@RequestMapping(value = "/mainYoutube.do", method = RequestMethod.POST)
	public Object setMainYoutube(@RequestParam(value = "img_seq") int img_seq, Model model, HttpSession session) {

		YoutubeVO vo = ytService.getYoutubeBySeq(img_seq);
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("title", vo.getTitle());
		retVal.put("path", vo.getPath());
		return retVal;
	}
}
