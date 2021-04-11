package com.bkc.user.dao;


import javax.validation.Valid;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public interface UserDAO {
	
	//회원가입
	public boolean insertUser(@Valid UserVO user);	
	
	
}
