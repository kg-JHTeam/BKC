package com.bkc.user.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.user.vo.GuestVO;

@Repository
public class GuestUserDAOImpl implements GuestUserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(GuestVO guest) {
		return sqlSession.insert("insert", guest);
	}

}
