package com.bkc.user.dao;

import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
	   this.sqlSession = sqlSession;
	}
	
	@Override
	public List<UserVO> getAdminUserList(UserVO user) {
		return sqlSession.selectList("getAdminUserList", user);
	}

	@Override
	public List<UserVO> getManagerUserList(UserVO user) {
		return sqlSession.selectList("getManagerUserList", user);
	}

	@Override
	public List<UserVO> getUserList(UserVO user) {
		return sqlSession.selectList("getUserList", user);
	}
	
	//회원가입
	@Override
	public boolean insertUser(UserVO user) {
		System.out.println("inserUser 수행");
		System.out.println(user);
		System.out.println(sqlSession);  //sqlSession이 없다. 
		int success = sqlSession.insert("userInsert", user); 
		if(success == 1) {
			return true;
		} else {
			return false;
		}
		
	}
}
