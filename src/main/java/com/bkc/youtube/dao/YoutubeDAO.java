package com.bkc.youtube.dao;

import java.util.List;

import com.bkc.youtube.vo.YoutubeVO;

public interface YoutubeDAO {
	
	// 유튜브 광고 정보 조회
	public List<YoutubeVO> getYoutubeList();
	
	// 사용중인 광고 리스트 조회
	public List<YoutubeVO> getYoutubeUsedList();
	
	// 유튜브 광고 정보 상세 조회
	public YoutubeVO getYoutubeBySeq(int seq);
	
	// 유튜브 광고 status 변경
	public int changeStatusYoutube(int img_seq);

	// 유튜브 광고 삭제
	public int deleteYoutube(int img_seq);

	// 유튜브 광고 추가
	public int insertYoutube(YoutubeVO vo);

	// 사용중인 유튜브 조회 
	public YoutubeVO getYoutube();

}