package com.bkc.user.service;

import java.util.List;

import javax.validation.Valid;

import com.bkc.user.vo.UserVO;

public interface UserService {
	
	//전체 회원 조회
	public List<UserVO> getUserList();
	
	//회원 가입
	public boolean insert(@Valid UserVO user);
	
	//회원 정보 수정
	public void update(@Valid UserVO user);
	
	//회원 삭제 -> enabled 만 1->0으로 변경
	public void delete(@Valid UserVO user);
	
	//비밀번호 체크 
	public UserVO passwdCheck(UserVO vo);
	
	//비밀번호 변경
	public void updatePasswd(UserVO vo);
	
}
