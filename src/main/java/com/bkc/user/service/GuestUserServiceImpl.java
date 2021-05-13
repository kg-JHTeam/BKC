package com.bkc.user.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.GuestUserDAO;
import com.bkc.user.vo.GuestVO;

@Service
public class GuestUserServiceImpl implements GuestService {

	@Autowired
	private GuestUserDAO guestUserDao;

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public String sendVerifyEmail(String email) {
		
		Random random = new Random();
		int range = (int) Math.pow(10, 6);
		int trim = (int) Math.pow(10, 6 - 1);
		int results = random.nextInt(range) + trim;
		String checkNumber = Integer.toString(results);
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			// 이메일에 인증 메일을 보낸다.
			String mailTo = email;

			String content = "<div style = font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid #ffd84a; margin: 100px auto; padding: 30px 0; box-sizing: border-box;'>"
					+ "<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
					+ "<span style='font-size: 15px; margin: 0 0 10px 3px;'>BKC</span><br />"
					+ "<span style='color: #ffd84a;'>BKC 회원가입 </span> 안내입니다." + "</h1>"
					+ "<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>" + "<b>" 
					+  "<br/>" + "비회원 인증번호는 : <b>" + checkNumber + "</b> 입니다.</p>" + "</div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				System.out.println("비회원 인증 전송 과정 실행");
				mimeMessage.setFrom(new InternetAddress("bkc1wogh@gmail.com", "BKC", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("BKC 인증번호 입니다.", "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent(content, "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};
		try {
			mailSender.send(preparator);
			System.out.println(email + " | 비회원 인증 메일전송.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return checkNumber;
	}

	@Override
	public int insert(GuestVO guest) {
		return guestUserDao.insert(guest);
	}

}
