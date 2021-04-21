package com.bkc.user.sms;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SMSController {

	// 문자를 보낼때 맵핑되는 메소드
	@RequestMapping(value = "/sendSms.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sendSms(HttpServletRequest request) throws Exception {
		Random random = new Random();

		int range = (int) Math.pow(10, 6);
		int trim = (int) Math.pow(10, 6 - 1);
		int results = random.nextInt(range) + trim;

		String api_key = "NCSGGM7FUQCUJQMR"; // 위에서 받은 api key를 추가
		String api_secret = "5PENVLCAQYEN4ZTLNQRO3BGXYRFICZJL"; // 위에서 받은 api secret를 추가

		com.bkc.user.sms.Coolsms coolsms = new com.bkc.user.sms.Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", (String) request.getParameter("phone")); // 수신번호

		set.put("from", "01063135712"); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
		set.put("text", "[BKC] 인증번호는 " + results + " 입니다."); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {

			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); 
			System.out.println(result.get("message")); // 에러메시지
		}

		return "event/eventPageAll"; // 문자 메시지 발송 성공했을때 number페이지로 이동함
	}
}
