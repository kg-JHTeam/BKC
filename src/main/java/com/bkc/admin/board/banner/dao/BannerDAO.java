package com.bkc.admin.board.banner.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.admin.board.banner.vo.BannerVO;


@Repository
public interface BannerDAO {
	
	//배너 리스트 조회 
	public List<BannerVO> getBannerList();

}
