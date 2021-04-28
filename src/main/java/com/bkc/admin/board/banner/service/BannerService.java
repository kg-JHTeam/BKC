package com.bkc.admin.board.banner.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.banner.vo.BannerVO;

@Service
public interface BannerService {
	
	// 전체 배너 조회
	public List<BannerVO> getBannerList();

	// 배너 상세 출력
	public BannerVO getBanner(int seq); //seq받아서 출력 

	// 사용중인 배너 조회
	public List<BannerVO> getBannerUsedList();

	// 배너 status 변경
	public int changeStatus(int img_seq);

	// 배너 삭제 
	public int deleteBanner(int img_seq);

	// 배너 등록 
	public int insertBanner(BannerVO vo);

	// 배너 수정
	public int updateBanner(BannerVO vo);
	
}
