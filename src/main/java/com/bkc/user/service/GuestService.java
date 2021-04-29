package com.bkc.user.service;

import org.springframework.stereotype.Service;

import com.bkc.user.vo.GuestVO;

@Service
public interface GuestService {

	//인증번호를 보낸다. 
	public String sendVerifyEmail(String userid);

	//비회원 추가시킴. 
	public int insert(GuestVO guest);

}
