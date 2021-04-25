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
	
	@Override
	public AboutbkcVO getAboutbkc(int seq) {
		return sqlSession.selectOne("getAboutbkc", seq);
	}
	
	@Override
	public int deleteAboutbkc(int seq) {
		return sqlSession.insert("deleteAboutbkc", seq);
	}
	
	@Override
	public int insertAboutbkc(AboutbkcVO aboutbkcVO) {
		return sqlSession.insert("insertAboutbkc", aboutbkcVO);
	}
	
	@Override
	public int updateAboutbkc(AboutbkcVO aboutbkcVO) {
		return sqlSession.insert("updateAboutbkc", aboutbkcVO);
	}
}
