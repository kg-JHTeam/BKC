package com.bkc.youtube.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.youtube.vo.YoutubeVO;

@Repository
public interface YoutubeDAO {
	
	// 유튜브 광고 (관리자) 정보 조회
	public List<YoutubeVO> getYoutubeList();
	
	// 유튜브 광고 (홈페이지) 정보 조회
	public List<YoutubeVO> getYoutubeHome(YoutubeVO youtubeVO);

	// 사용중인 광고 리스트 조회
	public List<YoutubeVO> getYoutubeUsedList();
	
	// 유튜브 광고 정보 상세 조회
	public YoutubeVO getYoutubeBySeq(int img_seq);
	
	// 유튜브 광고 status 변경
	public int changeStatusYoutube(int img_seq);

	// 유튜브 광고 status 매개변수값 제외 모두 변경 
	public int changeAllStatusYoutube(int img_seq);
	
	// 유튜브 광고 삭제
	public int deleteYoutube(int img_seq);

	// 유튜브 광고 추가
	public int insertYoutube(YoutubeVO vo);

	// 사용중인 유튜브 조회 
	public YoutubeVO getYoutube();

	// 유튜브 광고 수정
	public int updateYoutube(YoutubeVO vo);

}
