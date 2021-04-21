package com.bkc.youtube.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.youtube.vo.YoutubeVO;

@Service
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
	public YoutubeVO getYoutubeBySeq(int img_seq) {
		return sqlSession.selectOne("getYoutubeBySeq", img_seq);
	}

	@Override
	public int changeStatusYoutube(int img_seq) {
		return sqlSession.insert("changeStatus", img_seq);
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

}

