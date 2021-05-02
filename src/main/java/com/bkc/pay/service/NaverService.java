package com.bkc.pay.service;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.bkc.pay.naver.vo.NaverPayApprovalVO;
import com.bkc.pay.naver.vo.NaverPayReadyVO;

@Service
public class NaverService {
	private static final String HOST = "https://dev.apis.naver.com/{bkc}/naverpay/payments/v2/reserve HTTP/1.1";

	private NaverPayApprovalVO NaverPayApprovalVO;
	private NaverPayReadyVO NaverPayReadyVO;

	public static String NaverPayReady() {
		RestTemplate restTemplate = new RestTemplate();
		
		 // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "89ef55f574072cc355be21327caaa212");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
		return null;
	}

}
