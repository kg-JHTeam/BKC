package com.bkc.menuInform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.ChickenMenuVO;
@Repository
public class ChickenMenuDAOImpl implements ChickenMenuDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ChickenMenuVO> getChickenMenu() {
		System.out.println("getChickenMenu() 수행 ");
		return sqlSession.selectList("getChickenMenu");
	}

}
