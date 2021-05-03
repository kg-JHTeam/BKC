package com.bkc.pay.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.bkc.pay.kakao.vo.KakaoPayApprovalVO;
import com.bkc.pay.kakao.vo.KakaoPayReadyVO;

@Service
public class KakaoService {
	 private static final String HOST = "https://kapi.kakao.com";
	    
	    private KakaoPayReadyVO kakaoPayReadyVO;
	    private KakaoPayApprovalVO kakaoPayApprovalVO;
	    
	    //@SuppressWarnings("deprecation")
		public String kakaoPayReady() {
	 
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	       HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "89ef55f574072cc355be21327caaa212");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	         params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "gorany");
	        params.add("item_name", "갤럭시S9");
	        params.add("quantity", "1");
	        params.add("total_amount", "100");
	        params.add("tax_free_amount", "0");
	        params.add("approval_url", "http://localhost:8080/bkc/pay/kakaoPaySuccess.do");
	        params.add("cancel_url", "http://localhost:8080/bkc/pay/kakaoPayCancel");
	        params.add("fail_url", "http://localhost:8080/bkc/pay/kakaoPaySuccessFail");
	 
	         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	 
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	            
	            System.out.println("되나요.." + kakaoPayReadyVO);
	            
	            return kakaoPayReadyVO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	           
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	           
	            e.printStackTrace();
	        }
	        return "/pay";
	        
	    }
		  public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
			  
		        System.out.println("KakaoPayInfoVO............................................");
		       System.out.println("-----------------------------");
		        
		        RestTemplate restTemplate = new RestTemplate();
		 
		        // 서버로 요청할 Header
		        HttpHeaders headers = new HttpHeaders();
		        headers.add("Authorization", "KakaoAK " + "89ef55f574072cc355be21327caaa212");
		        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		 
		        // 서버로 요청할 Body
		        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		        params.add("cid", "TC0ONETIME");
		        params.add("tid", kakaoPayReadyVO.getTid());
		        params.add("partner_order_id", "1001");
		        params.add("partner_user_id", "gorany");
		        params.add("pg_token", pg_token);
		        params.add("total_amount", "100");
		        
		        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		        
		        try {
		            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
		            System.out.println("" + kakaoPayApprovalVO);
		          
		            return kakaoPayApprovalVO;
		        
		        } catch (RestClientException e) {
		            
		            e.printStackTrace();
		        } catch (URISyntaxException e) {
		           
		            e.printStackTrace();
		        }
		        
		        return null;
		    }
	
}
