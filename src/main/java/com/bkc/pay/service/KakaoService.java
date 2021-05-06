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

import com.bkc.delivery.vo.DvProductVO;
import com.bkc.delivery.vo.OrderDetailVO;
import com.bkc.delivery.vo.OrderVO;
import com.bkc.pay.kakao.vo.KakaoPayApprovalVO;
import com.bkc.pay.kakao.vo.KakaoPayReadyVO;

@Service
public class KakaoService {
	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	private OrderDetailVO OrderDetailVO;
	private OrderVO OrderVO;
	private DvProductVO  DvProductVO;

	public String kakaoPayReady() {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "89ef55f574072cc355be21327caaa212");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String,String> params = new LinkedMultiValueMap<String,String>();
		MultiValueMap<String,Integer> iparams = new LinkedMultiValueMap<String,Integer>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "100");
		params.add("partner_user_id", "gorany");
		params.add("item_name", OrderVO.getMainMenu());
		iparams.add("quantity", OrderDetailVO.getQuantity());
		iparams.add("total_amount",  OrderVO.getTotal_price());
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:80/bkc/pay/kakaoPaySuccess.do");
		params.add("cancel_url", "http://localhost:80/bkc/pay/kakaoPayCancel");
		params.add("fail_url", "http://localhost:80/bkc/pay/kakaoPaySuccessFail");

		HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			System.out.println("" + kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {

			e.printStackTrace();
		} catch (URISyntaxException e) {

			e.printStackTrace();
		}

		return "/delivery";

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
		MultiValueMap<String, Integer> iparams = new LinkedMultiValueMap<String, Integer>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", "100");
		params.add("partner_user_id", OrderVO.getMainMenu());
		params.add("pg_token", pg_token);
		iparams.add("total_amount", OrderVO.getTotal_price());

		HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		HttpEntity<MultiValueMap<String, Integer>> ibody = new HttpEntity<MultiValueMap<String, Integer>>(iparams, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
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
