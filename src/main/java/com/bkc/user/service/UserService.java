package com.bkc.user.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.bkc.user.vo.UserCouponVO;
import com.bkc.user.vo.UserVO;

@Service
public interface UserService {
	
	//id를 통해 회원 하나 조회
	public UserVO getUserById(String userid);
	
	//name과 phone을 통해 아이디를 찾음 
	public UserVO getUserByNameAndPhone(String name, String phone);
	
	//전체 회원 조회
	public List<UserVO> getUserList();
	
	//비회원 조회
	public List<UserVO> getNonUserList();
	
	//매장관리자 회원 조회
	public List<UserVO> getManagerUserList();
	
	//쿠폰관련 유저 리스트 
	public List<UserVO> getUserHavingCouponList();
	
	//회원 가입
	public boolean insert(@Valid UserVO user);
	
	//비밀번호 체크 
	public UserVO passwdCheck(UserVO vo);
	
	//비밀번호 변경
	public int updatePasswd(UserVO vo);
	
	//Service내 메서드
	//이메일로 임시 비밀번호 발급 메서드 
	public String sendTempPassword(UserVO vo);
	
	//회원가입 확인 이메일 전송
	public void sendJoinMail(UserVO vo);

	//네이버 카카오 변경
	public void updatePlatForm(String email, String type);

	//소셜로그인
	public int socialInsert(UserVO user);

	//변경 
	public int changeEnabled(UserVO user);
	
	//유저 삭제(enabled false로 변경)
	public int deleteUser(UserVO vo);
}
