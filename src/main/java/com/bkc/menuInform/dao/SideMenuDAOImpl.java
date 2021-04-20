package com.bkc.menuInform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.SideMenuVO;

@Repository
public class SideMenuDAOImpl implements SideMenuDAO {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<SideMenuVO> getSidemenuList() {
		System.out.println("getSidemenuList()수행  ");
		return sqlSession.selectList("getSidemenuList");
	}

	@Override
	public SideMenuVO getSidemenu(String product_serial) {
		System.out.println("getSidemenu()수행  ");
		return sqlSession.selectOne("getSidemenu", product_serial);
	}
}