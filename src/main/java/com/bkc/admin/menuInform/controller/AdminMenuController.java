package com.bkc.admin.menuInform.controller;

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
import com.bkc.admin.board.banner.vo.CheckVO;
import com.bkc.admin.menuInform.Service.AdMenuService;
import com.bkc.menuInform.vo.ProductVO;

@Controller
public class AdminMenuController {
	@Autowired
	private AdMenuService admenuService;

	public AwsS3 awss3 = AwsS3.getInstance();

	// 전체리스트출력
	@RequestMapping(value = "/admin/adminAllList.ad", method = RequestMethod.GET)
	public String showallList(Model model) {
		List<ProductVO> allList = admenuService.getallList();
		model.addAttribute("allList", allList);
		return "admin/subpages/menu/adminAllList";
	}

	// 치킨리스트 출력
	@RequestMapping(value = "/admin/adminchickenlist.ad", method = RequestMethod.GET)
	public String showchickenList(Model model) {
		List<ProductVO> adchikenlist = admenuService.getchickenList();
		model.addAttribute("adchikenlist", adchikenlist);
		return "admin/subpages/menu/adminchickenlist";
	}

	// 비어존 리스트 출력
	@RequestMapping(value = "/admin/adminbeerlist.ad", method = RequestMethod.GET)
	public String showbeerzoneList(Model model) {
		List<ProductVO> adbeerlist = admenuService.getbeerList();
		model.addAttribute("adbeerlist", adbeerlist);
		return "admin/subpages/menu/adminbeerlist";
	}

	// 사이드 리스트 출력
	@RequestMapping(value = "/admin/adminsidelist.ad", method = RequestMethod.GET)
	public String showsideList(Model model) {
		List<ProductVO> adsidelist = admenuService.getsideList();
		model.addAttribute("adsidelist", adsidelist);
		return "admin/subpages/menu/adminsidelist";
	}

	// 신메뉴 리스트 출력
	@RequestMapping(value = "/admin/adminnewlist.ad", method = RequestMethod.GET)
	public String shownewList(Model model) {
		List<ProductVO> adnewlist = admenuService.getnewList();
		model.addAttribute("adnewlist", adnewlist);
		return "admin/subpages/menu/adminnewlist";
	}

	// changeUseStatus.ad
	@RequestMapping(value = "/admin/changeUseStatus.ad", method = RequestMethod.GET)
	public String changeUseStatus(Model model, @RequestParam("product_serial") int product_serial) {
		admenuService.changeUseStatus(product_serial);
		return "redirect:/admin/adminAllList.ad";
	}

	// 메뉴 상세 출력
	@RequestMapping(value = "/admin/menuDetail.ad", method = RequestMethod.GET)
	public String getMenu(Model model, @RequestParam("product_serial") int product_serial) {
		ProductVO menu = admenuService.getMenu(product_serial);
		model.addAttribute("menu", menu);
		return "admin/subpages/menu/menuAdContent";
	}

	// 메뉴 수정
	// 1. 서버에서 삭제하지 않고, db 주소만 변경하는 방식으로 변경
	@RequestMapping(value = "/admin/modifyMenu.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyMenu(Model model, @RequestParam int product_serial, @RequestParam String product_name,
			@RequestParam String description, @RequestParam int price, @RequestParam String type_serial,
			@RequestParam MultipartFile menu) throws IOException, PSQLException {

		ProductVO vo = admenuService.getMenu(product_serial);
		vo.setDescription(description);
		vo.setProduct_name(product_name);
		vo.setPrice(price);
		vo.setType_serial(type_serial);

		CheckVO check = new CheckVO();
		check.setSuccess("true");
		int index = vo.getPath().indexOf("/", 20); // 자르기
		String key = vo.getPath().substring(index + 1); // 실제 경로
		
		// 파일을 업로드 하지 않고, 타이틀과 내용만 수정한 경우
		if (menu.getOriginalFilename() == "") { // 3. DB에서는 수정
			if (admenuService.updateMenu(vo) == 1) {
				check.setSuccess("true");
			} else {
				check.setSuccess("false");
			}
		}
		else {	// 2. 메뉴 올리기 - aws에 올리기
		InputStream is = menu.getInputStream();
		key = menu.getOriginalFilename();
		String contentType = menu.getContentType();
		long contentLength = menu.getSize();
		String bucket = "bkcbuc";
		String pathKey = "bkc_img/menu/" + key; // menu에올리기
		awss3.upload(is, pathKey, contentType, contentLength, bucket);

		// S3 '/bkc_img/menu/' 에 바로올리기 -> path 를 여기서 설정
		String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/" + key; // db에
		vo.setPath(filePath); // path 설정

		// 3. DB에서는 수정
		if (admenuService.updateMenu(vo) == 1) {
			check.setSuccess("true");
		} else {
			check.setSuccess("false");
		}

		// 메뉴리스트로 보내고, 확인 창띄우기위해서
		model.addAttribute("check", check);
		}
		return "redirect:/admin/adminAllList.ad";
	}


	// 메뉴삭제
	@RequestMapping(value = "/admin/deleteMenu.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteMenu(Model model, @RequestParam("product_serial") int product_serial) {
		ProductVO vo = admenuService.getMenu(product_serial);
		// DB에서 삭제
		if (admenuService.deleteMenu(product_serial) == 1) {
			System.out.println("메뉴 삭제 완료");
		} else {
			System.out.println("메뉴 삭제 실패 ");
		}
		System.out.println("메뉴삭제완료");

		// AWS에서 삭제
		int index = vo.getPath().indexOf("/", 20); // 자르기
		String key = vo.getPath().substring(index + 1); // 실제 경로
		System.out.println(key);

		// key위치에 있는 이미지 삭제
		awss3.delete(key); // AWS삭제

		return "redirect:/admin/adminAllList.ad";
	}

	// 메뉴등록페이지
	@RequestMapping(value = "/admin/menuUploadpage.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertMenu() {
		System.out.println("menuUploadpage");
		return "admin/subpages/menu/menuUploadpage";
	}

	// 메뉴등록
	@RequestMapping(value = "/admin/menuUpload.ad", method = { RequestMethod.POST })
	public String menuUpload(Model model, @RequestParam MultipartFile menu, @RequestParam String product_name,
			@RequestParam String description, @RequestParam String type_serial,@RequestParam int price) throws IOException, PSQLException {

		// aws s3 파일 업로드 처리
		ProductVO vo = new ProductVO();
		vo.setProduct_name(product_name);
		vo.setDescription(description);
		vo.setPrice(price);
		vo.setType_serial(type_serial);
		vo.setUse_status(true);

		InputStream is = menu.getInputStream();
		String key = menu.getOriginalFilename();
		String contentType = menu.getContentType();
		long contentLength = menu.getSize();

		String bucket = "bkcbuc";
		String pathKey = "bkc_img/menu/" + key;

		awss3.upload(is, pathKey, contentType, contentLength, bucket);
		System.out.println(key);
		String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/menu/" + key; //
		vo.setPath(filePath); // path

		CheckVO check = new CheckVO();
		check.setSuccess("true");

		if (admenuService.insertMenu(vo) == 1) {
			check.setSuccess("true");
			System.out.println("메뉴 등록완료");
		} else {
			check.setSuccess("false");
			System.out.println("메뉴 등록 실패 ");
		}
		model.addAttribute("check", check);
		return "redirect:/admin/adminAllList.ad";
	}

}
