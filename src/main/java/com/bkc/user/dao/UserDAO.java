package com.bkc.user.dao;


import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public interface UserDAO {
	
	//Crud - 회원 가입
	public boolean insertUser(@Valid UserVO user);	
	
	//cRud
	//홈페이지 관리자 회원 조회
	public List<UserVO> getAdminUserList(UserVO vo);	
	
	//매장 관리자 회원 조회
	public List<UserVO> getManagerUserList(UserVO vo);
	
	//일반 회원 조회
	public List<UserVO> getUserList(UserVO vo);	
	
	
}
