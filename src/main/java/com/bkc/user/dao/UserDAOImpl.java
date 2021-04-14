package com.bkc.user.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
	   this.sqlSession = sqlSession;
	}
	
	@Override
	public List<UserVO> getManagerUserList() {
		return sqlSession.selectList("getManagerUserList");
	}
	
	//회원 리스트 출력
	@Override
	public List<UserVO> getUserList() {
		return sqlSession.selectList("getUserList");
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
}
