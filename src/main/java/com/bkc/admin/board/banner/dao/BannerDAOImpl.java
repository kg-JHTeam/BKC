package com.bkc.admin.board.banner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.banner.vo.BannerVO;

@Repository
public class BannerDAOImpl implements BannerDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BannerVO> getBannerList() {
		return sqlSession.selectList("getBannerList");
	}

}
