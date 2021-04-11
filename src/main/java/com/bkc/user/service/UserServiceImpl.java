package com.bkc.user.service;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.UserDAOImpl;
import com.bkc.user.vo.UserVO;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAOImpl userDao;
	
	@Inject
    private PasswordEncoder passwordEncoder;
	
	//회원 조회 
	@Override
	public UserVO selectOne(String userid) {
		return null;
	}
	
	//회원가입
	public boolean insert(@Valid UserVO user) {

		//암호화 
        String encPassword = passwordEncoder.encode(user.getUserpw());
        user.setUserpw(encPassword);
        
        System.out.println("암호화된 비밀번호 : "+user.getUserpw());

        userDao.insertUser(user); //회원가입. 
        System.out.println(user);
        
        return userDao.insertUser(user);
	}

	//회원수정
	@Override
	public void update(@Valid UserVO user) {
		
	}
	
	//회원삭제 
	@Override
	public void delete(@Valid UserVO user) {
		
	}


	

}
