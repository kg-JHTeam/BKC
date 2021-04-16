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
	
}
