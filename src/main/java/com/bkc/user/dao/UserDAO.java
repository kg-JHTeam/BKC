package com.bkc.user.dao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public interface UserDAO {

	// Crud - 회원 가입
	public boolean insertUser(@Valid UserVO user);

	// cRud
	// id를 통해 user조회
	public UserVO getUserById(String userid);

	// name과 phone을 통해 user조회
	public UserVO getUserByNameAndPhone(String name, String phone);

	// 일반 회원 조회 - Admin
	public List<UserVO> getUserList();

	// 매장 관리자 회원 조회
	public List<UserVO> getManagerUserList();

	// 비회원 조회
	public List<UserVO> getNonUserList();

	// 로그인 및 시큐리티 관련
	// 비밀번호 찾기
	public UserVO passwdCheck(UserVO vo);

	// 비밀번호 변경
	public int updatePasswd(UserVO vo);

	//사용자 권한 select 하기
	public List<String> selectUserAuthOne(String username);

	public List<UserVO> getUserHavingCouponList();

	public int socialInsert(UserVO user);

	public int changeEnabled(UserVO user);
	
	public int deleteUser(UserVO vo);

}
