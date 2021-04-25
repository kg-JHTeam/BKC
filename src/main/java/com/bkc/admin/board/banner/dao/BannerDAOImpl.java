package com.bkc.admin.board.banner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.banner.vo.BannerVO;


@Repository
public class BannerDAOImpl implements BannerDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BannerVO> getBannerList() {
		return sqlSession.selectList("getBannerList");
	}

	@Override
	public List<BannerVO> getBannerUsedList() {
		return sqlSession.selectList("getBannerUsedList");
	}
	
	@Override
	public BannerVO getBanner(int img_seq) {
		return sqlSession.selectOne("getBanner", img_seq);
	}

	@Override
	public int changeStatus(int img_seq) {
		return sqlSession.insert("changeStatus", img_seq);
	}

	@Override
	public int deleteBanner(int img_seq) {
		return sqlSession.insert("deleteBanner", img_seq);
	}

	@Override
	public int insertBanner(BannerVO vo) {
		return sqlSession.insert("insertBanner", vo);
	}

	@Override
	public int updateBanner(BannerVO vo) {
		return sqlSession.insert("updateBanner", vo);
	}

}
