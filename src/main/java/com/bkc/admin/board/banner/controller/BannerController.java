package com.bkc.admin.board.banner.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bkc.admin.aws.AwsS3;
import com.bkc.admin.board.banner.service.BannerService;
import com.bkc.admin.board.banner.vo.BannerVO;
import com.bkc.admin.board.banner.vo.CheckVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BannerController {

	@Autowired
	private BannerService bannerService;

	public AwsS3 awss3 = AwsS3.getInstance();

	// 배너 리스트 출력.
	@RequestMapping(value = "/admin/bannerlist.ad", method = RequestMethod.GET)
	public String showBannerList(Model model) {
		List<BannerVO> banners = bannerService.getBannerList();
		model.addAttribute("banners", banners);
		return "admin/subpages/banner/bannerlist";
	}

	// 배너 상세 출력
	@RequestMapping(value = "/admin/bannerDetail.ad", method = RequestMethod.GET)
	public String showBanner(Model model, @RequestParam("seq") int seq) {
		BannerVO banner = bannerService.getBanner(seq);
		model.addAttribute("banner", banner);
		return "admin/subpages/banner/bannerContent";
	}

	// 배너 등록 페이지 이동.
	@RequestMapping(value = "/admin/bannerUploadpage.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertBanner() {
		return "admin/subpages/banner/bannerUploadpage";
	}

	// 실제 배너 추가
	@RequestMapping(value = "/admin/bannerUpload.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String bannerUpload(Model model, @RequestParam MultipartFile banner, @RequestParam String title,
			@RequestParam String content) throws IOException, PSQLException {

		// aws s3 파일 업로드 처리
		// Banner 세팅
		BannerVO vo = new BannerVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUse_status(true);

		InputStream is = banner.getInputStream();
		String key = banner.getOriginalFilename();
		String contentType = banner.getContentType();
		long contentLength = banner.getSize();

		String bucket = "bkcbuc";
		String pathKey = "bkc_img/main/banner/" + key; // banner에 올리기
		awss3.upload(is, pathKey, contentType, contentLength, bucket);

		System.out.println(key);

		// S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
		String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/main/banner/" + key; // db에
		vo.setPath(filePath); // path 설정

		CheckVO check = new CheckVO();
		check.setSuccess("true");

		if (bannerService.insertBanner(vo) == 1) {
			check.setSuccess("true");
		} else {
			check.setSuccess("false");
		}
		model.addAttribute("check", check);

		return "admin/subpages/banner/bannerUploadpage";
	}

	// 배너 수정
	@RequestMapping(value = "/admin/modifyBanner.ad", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyBanner(Model model, @RequestParam MultipartFile banner, @RequestParam int img_seq, String title,
			@RequestParam String content) throws IOException, PSQLException {

		BannerVO vo = bannerService.getBanner(img_seq);
		vo.setContent(content);
		vo.setTitle(title);

		CheckVO check = new CheckVO();
		check.setSuccess("true");

		// 파일을 업로드 하지 않고, 타이틀과 내용만 수정한 경우
		if (banner.getOriginalFilename() == "") {
			// 3. DB에서는 수정
			if (bannerService.updateBanner(vo) == 1) {
				check.setSuccess("true");
			} else {
				check.setSuccess("false");
			}
		}

		// 파일을 업로드하여 수정하는 경우
		else {
			// 1. 배너 AWS에서 삭제
			int index = vo.getPath().indexOf("/", 20); // 자르기
			String key = vo.getPath().substring(index + 1); // 실제 경로

			// key위치에 있는 이미지 삭제
			awss3.delete(key);

			// 2. 배너 올리기 - aws에 올리기
			InputStream is = banner.getInputStream();
			key = banner.getOriginalFilename();
			String contentType = banner.getContentType();
			long contentLength = banner.getSize();

			String bucket = "bkcbuc";
			String pathKey = "bkc_img/main/banner/" + key; // banner에 올리기
			awss3.upload(is, pathKey, contentType, contentLength, bucket);

			// S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
			String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/main/banner/" + key; // db에
			vo.setPath(filePath); // path 설정

			// 3. DB에서는 수정
			if (bannerService.updateBanner(vo) == 1) {
				check.setSuccess("true");
			} else {
				check.setSuccess("false");
			}
		}
		
		// 배너리스트로 보내고, 확인 창띠우기위해서
		model.addAttribute("check", check);
		List<BannerVO> banners = bannerService.getBannerList();
		model.addAttribute("banners", banners);
		return "admin/subpages/banner/bannerlist";
	}

	// 배너 사용 | 미사용 변경
	@RequestMapping(value = "/admin/changeStatusBanner.ad", method = RequestMethod.GET)
	public String changeStatusBanner(Model model, @RequestParam("img_seq") int img_seq) {
		if (bannerService.changeStatus(img_seq) == 1) {
			System.out.println("배너 변경 완료");
		} else {
			System.out.println("배너 변경 실패 ");
		}
		return "redirect:/admin/bannerlist.ad";
	}

	// 배너 삭제
	@RequestMapping(value = "/admin/deleteBanner.ad", method = RequestMethod.GET)
	public String deleteBanner(@RequestParam("img_seq") int img_seq, Model model) {
		BannerVO vo = bannerService.getBanner(img_seq);
		// 배너 DB에서 삭제
		if (bannerService.deleteBanner(vo.getImg_seq()) == 1) {
			System.out.println("배너 삭제 완료");
		} else {
			System.out.println("배너 삭제 실패 ");
		}

		// 배너 AWS에서 삭제
		int index = vo.getPath().indexOf("/", 20); // 자르기
		String key = vo.getPath().substring(index + 1); // 실제 경로
		System.out.println(key);

		// key위치에 있는 이미지 삭제
		awss3.delete(key); // AWS삭제

		return "redirect:/admin/bannerlist.ad";
	}
}
