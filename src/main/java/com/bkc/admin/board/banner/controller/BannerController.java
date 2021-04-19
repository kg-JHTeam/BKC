package com.bkc.admin.board.banner.controller;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bkc.admin.aws.AwsS3;
import com.bkc.admin.board.banner.service.BannerService;
import com.bkc.admin.board.banner.vo.BannerVO;

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
		System.out.println("seq : " + seq);
		System.out.println("banner : " + banner.toString());
		model.addAttribute("banner", banner);
		return "admin/subpages/banner/bannerContent";
	}
	
	// 배너 등록 페이지 이동.
	@RequestMapping(value = "/admin/bannerUploadpage.ad",  method = {RequestMethod.GET, RequestMethod.POST})
	public String insertBanner() {
		return "admin/subpages/banner/bannerUploadpage";
	}
	
	// 실제 배너 추가
	@RequestMapping(value = "/admin/bannerUpload.ad",  method = {RequestMethod.GET, RequestMethod.POST}) 
	public String bannerUpload(Model model, MultipartFile banner,
			@RequestParam("title") String title,
			@RequestParam("content") String content
			) throws IOException, PSQLException {
		
		// aws s3 파일 업로드 처리 
		// Banner 세팅
		BannerVO vo = new BannerVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUse_status(true);
		
		InputStream is = banner.getInputStream();  //파일이 안들어옴. 
		String key = banner.getOriginalFilename();
		String contentType = banner.getContentType();
		long contentLength = banner.getSize();
		
		String bucket = "bkcbuc";
		
		awss3.upload(is, key, contentType, contentLength, bucket);
		System.out.println(key);
		
		//S3 '/bkc_img/main/banner/' 에 바로올리기 -> path 를 여기서 설정
		String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/main/banner/" + key;
		vo.setPath(filePath);	//path 설정
		
		if(bannerService.insertBanner(vo)==1) {
			System.out.println("배너 업로드 완료");
		} else {
			System.out.println("배너 업로드 실패 ");
		}
		return "redirect:/admin/bannerlist.ad";
	}
	
	// 배너 수정
	@RequestMapping(value = "/admin/modifyBanner.ad", method = RequestMethod.POST)
	public String modifyBanner(Model model, @RequestParam("seq") int seq) {
		BannerVO banner = bannerService.getBanner(seq);
		
		System.out.println("seq : " + seq);
		System.out.println("banner : " + banner.toString());

		model.addAttribute("banner", banner);

		return "admin/subpages/banner/bannerContent";
	}

	// 배너 사용 | 미사용 변경
	@RequestMapping(value = "/admin/changeStatusBanner.ad", method = RequestMethod.GET)
	public String changeStatusBanner(Model model, @RequestParam("img_seq") int img_seq){
			if(bannerService.changeStatus(img_seq)==1) {
				System.out.println("배너 변경 완료");
			} else {
				System.out.println("배너 변경 실패 ");
			}
		return "redirect:/admin/bannerlist.ad";
	}
	
	//배너 삭제
	@RequestMapping(value = "/admin/deleteBanner.ad", method = RequestMethod.GET)
	public String deleteBanner(Model model,
			@RequestParam("img_seq") int img_seq){
		
		//AWS에서 삭제 
		BannerVO banner = bannerService.getBanner(img_seq);
		
		int index = banner.getPath().indexOf("/", 20);	//자르기 
		String key = banner.getPath().substring(index+1);	//실제 경로 
		
		System.out.println(banner.toString());
		System.out.println("index : "+index + " | key : " + key);
		
		//key위치에 있는 이미지 삭제 
		awss3.delete(key); //AWS삭제 
		
		//DB에서 삭제
		if(bannerService.deleteBanner(img_seq)==1) {
			System.out.println("배너 삭제 완료");
		} else {
			System.out.println("배너 삭제 실패 ");
		}
		
		System.out.println("삭제 완료");
		
		return "redirect:/admin/bannerlist.ad";
	}
}
