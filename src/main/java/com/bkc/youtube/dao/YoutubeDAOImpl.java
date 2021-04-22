package com.bkc.youtube.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bkc.youtube.vo.YoutubeVO;

@Repository
public class YoutubeDAOImpl implements YoutubeDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<YoutubeVO> getYoutubeList() {
		return sqlSession.selectList("getYoutubeList");
	}

	@Override
	public List<YoutubeVO> getYoutubeUsedList() {
		return sqlSession.selectList("getYoutubeUsedList");
	}

	@Override
	public YoutubeVO getYoutubeBySeq(YoutubeVO vo) {
		return sqlSession.selectOne("getYoutubeBySeq", vo);
	}

	@Override
	public int changeStatusYoutube(int img_seq) {
		return sqlSession.insert("changeStatusYoutube", img_seq);
	}

	@Override
	public int deleteYoutube(int img_seq) {
		return sqlSession.insert("deleteYoutube", img_seq);
	}

	@Override
	public int insertYoutube(YoutubeVO vo) {
		return sqlSession.insert("insertYoutube", vo);
	}

	@Override
	public YoutubeVO getYoutube() {
		return sqlSession.selectOne("getYoutube");
	}

	@Override
	public int updateYoutube(YoutubeVO vo) {
		return sqlSession.insert("updateYoutube", vo);
	}
}

