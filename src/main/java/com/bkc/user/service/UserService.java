package com.bkc.user.service;

import javax.validation.Valid;

import com.bkc.user.vo.UserVO;

public interface UserService {
	//회원 가입
	public void insert(@Valid UserVO user);
	
	//회원 정보 수정
	public void update(@Valid UserVO user);
	
	//회원 삭제 -> enabled 만 1->0으로 변경
	public void delete(@Valid UserVO user);
	
	//로그인 	-> 시큐리티에서 구현됨.
	//로그아웃 	-> 시큐리티에서 구현됨.
}
