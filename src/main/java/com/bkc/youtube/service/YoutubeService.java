package com.bkc.youtube.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.youtube.vo.YoutubeVO;

@Service
public interface YoutubeService {

	// 사용중인 유튜브 조회
	public YoutubeVO getYoutube();

	// 전체 유튜브 광고 정보 조회
	public List<YoutubeVO> getYoutubeList();

	// 유튜브 광고 정보 상세 조회
	public YoutubeVO getYoutubeBySeq(YoutubeVO vo);

	// 유튜브 광고 사용 여부
	public int changeStatusYoutube(int img_seq);

	// 유튜브 광고 삭제
	public int deleteYoutube(int img_seq);

	// 유튜브 광고 추가
	public int insertYoutube(YoutubeVO vo);
	
	// 유튜브 광고 수정
	public int updateYoutube(YoutubeVO vo);

}
