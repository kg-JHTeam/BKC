package com.bkc.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.subpages.controller.CustomerServiceController;
import com.bkc.user.dao.UserDAO;
import com.bkc.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	// id를 통해 user조회
	@Override
	@Transactional
	public UserVO getUserById(String userid) {
		return userDao.getUserById(userid);
	}

	// name과 phone을 통해 user조회
	@Override
	@Transactional
	public UserVO getUserByNameAndPhone(String name, String phone) {
		return userDao.getUserByNameAndPhone(name, phone);
	}

	@Override
	@Transactional
	public List<UserVO> getUserHavingCouponList() {
		return userDao.getUserHavingCouponList();
	}
	
	// 회원조회 - Admin
	@Override
	@Transactional
	public List<UserVO> getUserList() {
		return userDao.getUserList();
	}

	// 매장관리자 조회
	@Override
	@Transactional
	public List<UserVO> getManagerUserList() {
		return userDao.getManagerUserList();
	}

	// 비회원 조회
	@Override
	@Transactional
	public List<UserVO> getNonUserList() {
		return userDao.getNonUserList();
	}

	// 회원가입
	public boolean insert(UserVO user) {
		System.out.println("암호화 전 비밀번호  : " + user.getPassword());
		// BCryptPasswordEncoder로 암호화 로직 수행
		String encPassword = passwordEncoder.encode(user.getPassword()); // 비밀번호 암호화 수행.
		user.setPassword(encPassword.trim()); // 비밀번호 암호화 시켜서 넣기.
		System.out.println("암호화된 비밀번호 : " + user.getPassword()); // 검사
		return userDao.insertUser(user);
	}
	
	// 비밀번호 체크
	@Override
	@Transactional
	public UserVO passwdCheck(UserVO vo) {
		return userDao.passwdCheck(vo);
	}

	// 비밀번호 변경
	@Override
	@Transactional
	public int updatePasswd(UserVO vo) {
		return userDao.updatePasswd(vo);
	}

	// 회원가입 확인 메일 전송 메서드
	@Override
	@Transactional
	public void sendJoinMail(UserVO vo) {
		String mailTo = vo.getUserid(); // 아이디가 곧 이메일
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			String content = "<div style = font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid #ffd84a; margin: 100px auto; padding: 30px 0; box-sizing: border-box;'>"
					+ "<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
					+ "<span style='font-size: 15px; margin: 0 0 10px 3px;'>BKC</span><br />"
					+ "<span style='color: #ffd84a;'>BKC 회원가입 </span> 안내입니다." + "</h1>"
					+ "<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>" + "<b>"
					+ vo.getName() + "</b>님 환영합니다! <br/>" + "BKC 에 가입해 주셔서 진심으로 감사드립니다.<br/>" + "</p>" + "</div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				System.out.println("이메일 전송 과정 실행");
				mimeMessage.setFrom(new InternetAddress("bkc1wogh@gmail.com", "BKC", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("BCK에 가입하신것을 환영합니다.", "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent(content, "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};
		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 임시 비밀번호 생성 및 이메일 전송
	@Override
	@Transactional
	public String sendTempPassword(UserVO vo) {

		// 8자리 인증번호 생성후 이메일 전송
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < 8; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}

		String mailTo = vo.getUserid(); // 아이디가 곧 이메일
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			String content = "<div style = font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid #ffd84a; margin: 100px auto; padding: 30px 0; box-sizing: border-box;'>"
					+ "<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
					+ "<span style='font-size: 15px; margin: 0 0 10px 3px;'>BKC</span><br />"
					+ "<span style='color: #ffd84a;'>BKC 임시 비밀번호 </span> 안내입니다." + "</h1>"
					+ "<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>"
					+ "안녕하세요 <br/>" + "요청하신 임시 비밀번호가 생성되었습니다.<br /></p>"
					+ "<p style='font-size: 16px; margin: 40px 5px 20px; line-height: 28px;'>" + "임시 비밀번호: <br />"
					+ "<span style='font-size: 24px;'>" + sb.toString() + "</span>" + "</p>" + "</div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				System.out.println("임시비밀번호 전송 과정 실행");
				mimeMessage.setFrom(new InternetAddress("bkc1wogh@gmail.com", "BKC", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("BKC 임시비밀번호 입니다.", "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent(content, "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};

		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sb.toString();
	}

	@Override
	public void updatePlatForm(String email, String type) {}

	@Override
	@Transactional
	public int socialInsert(UserVO user) {
		return userDao.socialInsert(user);
	}

	@Override
	public int changeEnabled(UserVO user) {
		return userDao.changeEnabled(user);
	}
	
	@Override
	public int deleteUser(UserVO vo) {
		return userDao.deleteUser(vo);
	}
}
