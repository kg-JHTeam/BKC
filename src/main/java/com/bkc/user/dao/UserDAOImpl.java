package com.bkc.user.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//아이디로 회원 하나 조회 
	@Override
	public UserVO getUserById(String userid) {
		return sqlSession.selectOne("getUserById", (String) userid);
	}
	
	//회원 리스트 출력
	@Override
	public List<UserVO> getUserList() {
		return sqlSession.selectList("getUserList");
	}
	
	//매장 관리자 출력
	@Override
	public List<UserVO> getManagerUserList() {
		return sqlSession.selectList("getManagerUserList");
	}
	
	@Override
	public List<UserVO> getUserHavingCouponList() {
		return sqlSession.selectList("getUserHavingCouponList");
	}
	
	//비회원 출력
	@Override
	public List<UserVO> getNonUserList() {
		return sqlSession.selectList("getNonUserList");
	}
	
	//회원가입
	@Override
	public boolean insertUser(UserVO user) {
		System.out.println("inserUser 수행");
		System.out.println(user);
		System.out.println(sqlSession);  
		int success = sqlSession.insert("userInsert", user); 
		if(success == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	//비밀번호 찾기
	@Override
	public UserVO passwdCheck(UserVO vo) {
		return sqlSession.selectOne("UserDAO.passwdCheck", vo);
	}
	
	//비밀번호 변경
	@Override
	public int updatePasswd(UserVO vo) {
		return sqlSession.insert("updatePasswd", vo);
	}
	
	//name과 phone을 통해 user조회
	@Override
	public UserVO getUserByNameAndPhone(String name, String phone) {
		UserVO vo = new UserVO();
		vo.setName(name);
		vo.setPhone(phone);
		return sqlSession.selectOne("getUserByNameAndPhone", vo);		
	}

	@Override
	public List<String> selectUserAuthOne(String username) {
		return null;
	}

	@Override
	public int socialInsert(UserVO user) {
		return sqlSession.insert("socialInsert");
	}

	@Override
	public int changeEnabled(UserVO vo) {
		return sqlSession.insert("changeEnabled", vo);
	}
	@Override
	public int deleteUser(UserVO vo) {
		return sqlSession.insert("deleteUser", vo);
	}
}
