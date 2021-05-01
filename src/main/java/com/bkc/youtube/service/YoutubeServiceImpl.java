package com.bkc.youtube.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.youtube.dao.YoutubeDAO;
import com.bkc.youtube.vo.YoutubeVO;

@Service
public class YoutubeServiceImpl implements YoutubeService {

	@Autowired
	private YoutubeDAO ytDao;

	// 전체 유튜브 광고 정보 조회
	@Override
	public List<YoutubeVO> getYoutubeList() {
		return ytDao.getYoutubeList();
	}

	// 전체 유튜브 광고 (홈페이지) 정보 조회
	@Override
	public List<YoutubeVO> getYoutubeHome(YoutubeVO youtubeVO) {
		return ytDao.getYoutubeHome(youtubeVO);
	}

	// 유튜브 광고 정보 상세 조회
	@Override
	public YoutubeVO getYoutubeBySeq(int img_seq) {
		return ytDao.getYoutubeBySeq(img_seq);
	}

	// 유튜브 광고 사용 여부 변경
	@Override
	public int changeStatusYoutube(int img_seq) {
		return ytDao.changeStatusYoutube(img_seq);
	}

	// 받아온 값 제외 모든 값 변경
	@Override
	public int changeAllStatusYoutube(int img_seq) {
		return ytDao.changeAllStatusYoutube(img_seq);
	}

	// 유튜브 광고 삭제
	@Override
	public int deleteYoutube(int img_seq) {
		return ytDao.deleteYoutube(img_seq);
	}

	// 유튜브 광고 추가
	@Override
	public int insertYoutube(YoutubeVO vo) {
		return ytDao.insertYoutube(vo);
	}

	// 사용중인 유튜브 조회
	@Override
	public YoutubeVO getYoutube() {
		return ytDao.getYoutube();
	}

	// 유튜브 광고 수정
	@Override
	public int updateYoutube(YoutubeVO vo) {
		return ytDao.updateYoutube(vo);
	}

	

}
