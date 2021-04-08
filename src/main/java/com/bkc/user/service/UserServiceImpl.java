package com.bkc.user.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.user.dao.UserDAO;
import com.bkc.user.vo.UserVO;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDao;
	
	public void insert(@Valid UserVO user) {
		
	}

	@Override
	public void update(@Valid UserVO user) {
		
	}

	@Override
	public void delete(@Valid UserVO user) {
		
	}

}
