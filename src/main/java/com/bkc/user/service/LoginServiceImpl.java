package com.bkc.user.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.bkc.user.dao.UserDAO;
import com.bkc.user.vo.UserVO;

public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private UserDAO user;
	
	@Override
	public void login(UserVO user) {
		
	}

}
