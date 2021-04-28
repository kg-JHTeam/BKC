package com.bkc.delivery.controller;

import java.io.IOException;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bkc.admin.board.businessInformation.service.BusinessInformationService;
import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;
import com.bkc.delivery.service.CautionService;
import com.bkc.delivery.service.DvProductService;
import com.bkc.delivery.vo.CautionVO;
import com.bkc.delivery.vo.DvProductVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.menuInform.vo.ProductVO;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Controller
@RequestMapping(value = "/delivery", method = RequestMethod.GET)
public class DeliveryController {

	@Autowired
	private BusinessInformationService biService;

	@Autowired
	private UserService userService;

	@Autowired
	private CautionService cService;

	@Autowired
	private DvProductService pService;

	// 회원 주문 페이지로 이동
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery(CautionVO cautionVO, Model model) {
		System.out.println("delivery 페이지 이동");

		// 유의사항 화면출력
		List<CautionVO> CautionList = cService.CautionList(cautionVO);
		model.addAttribute("CautionList", CautionList);

		// 현재 로그인한 사용자 추가
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		UserVO user = userService.getUserById(userDetails.getUsername());
		model.addAttribute("user", user);

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		
		//치킨메뉴
		List<DvProductVO> chickendv = pService.getChickenMenudv();
		System.out.println(chickendv);
		model.addAttribute("chickendv", chickendv);
		
		//사이드메뉴
		List<DvProductVO> sidedv = pService.getSideMenudv();
		System.out.println(sidedv);
		model.addAttribute("sidedv", sidedv);
		
		//비어존
		List<DvProductVO> beerdv = pService.getBeerZonedv();
		System.out.println(beerdv);
		model.addAttribute("beerdv", beerdv);
		
		//new메뉴
		List<DvProductVO> newdv = pService.getNewdv();
		System.out.println(newdv);
		model.addAttribute("newdv", newdv);
		
		return "delivery/delivery";
	}

	// 주문내역 페이지로 이동
	@RequestMapping(value = "/orderList.do", method = RequestMethod.GET)
	public String orderList(Model model) {
		System.out.println("회원 주문내역 페이지 이동");

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/orderList";
	}

	// 주문상세 페이지로 이동
	@RequestMapping(value = "/orderDetail.do", method = RequestMethod.GET)
	public String orderDetail(Model model) {
		System.out.println("회원 주문상세 페이지 이동");

		// 푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/orderDetail";
	}
	
	//mybkc 페이지로 이동
	@RequestMapping(value = "/mybkc.do", method = RequestMethod.GET)
	public String mybkc(Model model) {
		System.out.println("mybkc페이지로 이동");
		
		//푸터추가
		BusinessInformationVO bi = biService.getBusinessInformation(1);
		model.addAttribute("bi", bi);
		return "delivery/mybkc";
	}
	
	//유의사항 관리자 리스트
	@RequestMapping(value = "/admin/cautionList.ad", method = {RequestMethod.GET})
	public String CautionList(CautionVO cautionVO, Model model) {

		// 유의사항
		List<CautionVO> CautionList = cService.CautionList(cautionVO);
		model.addAttribute("CautionList", CautionList);

		System.out.println("d");
		return "/admin/delivery/cautionList";
	}

	// 유의사항 관리자 업로드 페이지
	@RequestMapping(value = "/admin/cautionUploadpage.ad", method = RequestMethod.GET)
	public String CautionUploadPage() {
		return "admin/delivery/cautionUpload";
	}

	// 유의사항 관리자 업로드 전송
	@RequestMapping(value = "/admin/CautionUpload.ad", method = RequestMethod.GET)
	public String CautionUpload(@RequestParam String content) throws IOException, PSQLException {

		CautionVO cautionVO = new CautionVO();
		cautionVO.setContent(content);

		cService.CautionInsert(cautionVO);

		return "redirect:/delivery/admin/cautionList.ad";
	}

	// 유의사항 관리자 수정화면
	@RequestMapping(value = "/admin/CautionDetail.ad", method = RequestMethod.GET)
	public String CautionDetail(Model model, @RequestParam("seq") int seq) {

		CautionVO cautionVO = cService.getCaution(seq);
		model.addAttribute("CautionVO", cautionVO);

		return "admin/delivery/cautionContent";
	}

	// 유의사항 관리 수정완료
	@RequestMapping(value = "/admin/CautionUpdate.ad", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyCaution(@RequestParam("content") String content, Model model, @RequestParam("seq") int seq) {

		CautionVO cautionVO = cService.getCaution(seq);
		cautionVO.setContent(content);
		cautionVO.setSeq(seq);

		cService.CautionUpdate(cautionVO);

		model.addAttribute("CautionVO", cautionVO);
		return "redirect:/delivery/admin/cautionList.ad";
	}

	// 유의사항 삭제
	@RequestMapping(value = "/admin/CautionDelete.ad", method = RequestMethod.GET)
	public String FaqDelete(Model model, @RequestParam("seq") int seq) {

		cService.CautionDelete(seq);

		System.out.println("삭제 완료");

		return "redirect:/delivery/admin/cautionList.ad";
	}

	
}
