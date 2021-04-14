package com.bkc.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bkc.subpages.controller.CustomerServiceController;
import com.bkc.user.dao.UserDAO;
import com.bkc.user.vo.UserVO;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDao;
	
	@Inject
	private BCryptPasswordEncoder passwordEncoder;
	
	//회원조회 - Admin
	@Override
	public List<UserVO> getUserList() {
		return userDao.getUserList();
	}
	@Override
	public List<UserVO> getManagerUserList() {
		return userDao.getManagerUserList();
	}
	//회원가입
	public boolean insert(UserVO user) {
		System.out.println("암호화 전 비밀번호  : " + user.getPassword());   
		
		//BCryptPasswordEncoder로 암호화 로직 수행 
        String encPassword = passwordEncoder.encode(user.getPassword()); //비밀번호 암호화 수행.
        user.setPassword(encPassword.trim());	//비밀번호 암호화 시켜서 넣기.
        System.out.println("암호화된 비밀번호 : " + user.getPassword());	//검사
        return userDao.insertUser(user);
	}

	//회원수정
	@Override
	public void update(UserVO user) {
		
	}
	
	//회원삭제 
	@Override
	public void delete(UserVO user) {
		
	}
	
	//비밀번호 체크
	@Override
	public UserVO passwdCheck(UserVO vo) {
		System.out.println("UserServiceImpl passwdCheck(vo)");
		return userDao.passwdCheck(vo);
	}
	
	//비밀번호 변경 
	@Override
	public void updatePasswd(UserVO vo) {
		
	}

	
}
