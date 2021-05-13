package com.bkc.youtube.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.youtube.vo.YoutubeVO;

@Repository
public class YoutubeDAOImpl implements YoutubeDAO {

	@Autowired
	private SqlSession sqlSession;

	// 유튜브 광고 (관리자) 정보 조회)
	@Override
	public List<YoutubeVO> getYoutubeList() {
		return sqlSession.selectList("getYoutubeList");
	}

	// 유튜브 광고(홈페이지) 정보 조회
	@Override
	public List<YoutubeVO> getYoutubeHome(YoutubeVO youtubeVO) {
		return sqlSession.selectList("getYoutubeHome", youtubeVO);
	}

	// 사용중인 광고 리스트 조회
	@Override
	public List<YoutubeVO> getYoutubeUsedList() {
		return sqlSession.selectList("getYoutubeUsedList");
	}

	// 유튜브 광고 정보 상세 조회
	@Override
	public YoutubeVO getYoutubeBySeq(int img_seq) {
		return sqlSession.selectOne("getYoutubeBySeq", img_seq);
	}

	// 유튜브 광고 status 변경
	@Override
	public int changeStatusYoutube(int img_seq) {
		return sqlSession.insert("changeStatusYoutube", img_seq);
	}

	// 유튜브 광고 status 매개변수값 제외 모두 변경 
	@Override
	public int changeAllStatusYoutube(int img_seq) {
		return sqlSession.insert("changeAllStatusYoutube", img_seq);
	}

	// 유튜브 광고 삭제
	@Override
	public int deleteYoutube(int img_seq) {
		return sqlSession.insert("deleteYoutube", img_seq);
	}

	// 유튜브 광고 추가
	@Override
	public int insertYoutube(YoutubeVO vo) {
		return sqlSession.insert("insertYoutube", vo);
	}

	// 사용중인 유튜브 조회 
	@Override
	public YoutubeVO getYoutube() {
		return sqlSession.selectOne("getYoutube");
	}

	// 유튜브 광고 수정
	@Override
	public int updateYoutube(YoutubeVO vo) {
		return sqlSession.insert("updateYoutube", vo);
	}
}

