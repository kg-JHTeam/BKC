package com.bkc.test;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/service-context.xml"})
public class MailTest {
	
	@Autowired
	private JavaMailSender mailSender;

	@Test
	public void mailTest() {
		String mailTo = "dhqkgbs@naver.com";
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				messageHelper.setFrom(new InternetAddress("rbghwogh123@gmail.com", "BKC", "UTF-8")); // 보내는 사람
				messageHelper.setTo(InternetAddress.parse(mailTo)); // 받는사람
				messageHelper.setSubject("메일 발송 테스트"); // 제목
				messageHelper.setText("", "<div>test mail</div>"); // 내용
				messageHelper.setReplyTo(new InternetAddress("rbghwogh123@gmail.com", "BKC", "UTF-8")); // 답장받을 주소
			}
		};
		
		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void sendMail() {
		String mailTo = "dhqkgbs@naver.com";
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setFrom(new InternetAddress("rbghwogh123@gmail.com", "BKC", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("메일 발송 테스트", "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent("test mail 발송중", "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};

		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}