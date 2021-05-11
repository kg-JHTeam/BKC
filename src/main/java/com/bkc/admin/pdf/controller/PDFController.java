package com.bkc.admin.pdf.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bkc.admin.pdf.service.PDFService;

@Controller
public class PDFController {
	@Inject
	private PDFService pdfservice; 
	
	// PDF 기능 
	@ResponseBody //무조건 필요함 
	@RequestMapping("/admin/orderlist.ad") // View에서 맵핑 url 주소
	//@RequestParam String newpdf [ newpdf는 스크립트안에 함수기능에 있는 변수값이랑 일치해야합니다 ]
	public int list(HttpServletRequest request, @RequestParam String newpdf) throws Exception {
		int result = pdfservice.createPdf(newpdf); //result값에 성공 1 실패 0을 반환합니다.
		return result; // result를 반환해줍니다.
	}

}
