package com.bkc.admin.board.menuInfom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.menuInfom.vo.MenuAdVO;

@Repository
public class MenuAdDAOImpl implements MenuAdDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MenuAdVO> getMenuAdList() {
		return sqlSession.selectList("getMenuAdList");
	}

	@Override
	public MenuAdVO getMenuAd(int product_serial) {
		return sqlSession.selectOne("getMenuAd", product_serial);
	}

}
