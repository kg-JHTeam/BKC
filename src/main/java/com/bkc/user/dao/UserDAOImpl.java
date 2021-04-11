package com.bkc.user.dao;

import java.io.InputStream;

import javax.validation.Valid;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private static SqlSessionFactory sqlMapper;
	/*
	static {
		String resource = "./resources/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception");
		}
	} */
	
	//회원가입
	@Override
	public boolean insertUser(@Valid UserVO user) {
		SqlSession session = sqlMapper.openSession();
		
		int success = 0;
		success = session.insert("userInsert", user); 
		
		session.commit();	//커밋
		session.close();	//session 비활성화
		
		if(success == 1) {
			return true;
		} else {
			return false;
		}
		
	}

}
