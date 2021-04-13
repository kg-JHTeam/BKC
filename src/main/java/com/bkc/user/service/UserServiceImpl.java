package com.bkc.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.UserDAO;
import com.bkc.user.vo.UserVO;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDao;
	
	@Inject
    private PasswordEncoder passwordEncoder;
	
	//회원 조회 
	@Override
	public UserVO selectOne(String userid) {
		return null;
	}
	public List<UserVO> getUserList(UserVO user) {
		return userDao.getUserList(user);
	}
	
	//회원가입
	public boolean insert(UserVO user) {
		//암호화 로직 수행 
        String encPassword = passwordEncoder.encode(user.getPassword()); //비밀번호 암호화 수행.
        user.setPassword(encPassword);	//비밀번호 암호화 시켜서 넣기.
        System.out.println("암호화된 비밀번호 : "+user.getPassword());	//검사
        
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
}
