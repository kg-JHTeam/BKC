package com.bkc.subpages.brand.bkcstory.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;

@Repository
public class AboutbkcDAOImpl implements AboutbkcDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AboutbkcVO> AboutbkcList(AboutbkcVO aboutbkcVO){
		return sqlSession.selectList("AboutbkcList", aboutbkcVO);
	}

}
