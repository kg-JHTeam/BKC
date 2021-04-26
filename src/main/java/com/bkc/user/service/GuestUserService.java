package com.bkc.user.service;

import org.springframework.stereotype.Service;

@Service
public interface GuestUserService {

	//인증번호를 보낸다. 
	public String sendVerifyEmail(String userid);

}
