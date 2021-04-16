package com.bkc.admin.board.banner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.banner.dao.BannerDAO;
import com.bkc.admin.board.banner.vo.BannerVO;

@Service
public class BannerServiceImpl implements BannerService{
	
	@Autowired
	private BannerDAO bannerDao;
	
	@Override
	public List<BannerVO> getBannerList() {
		System.out.println("bannerService.getBannerList()");
		return bannerDao.getBannerList();
	}

	@Override
	public BannerVO getBanner(int seq) {
		System.out.println("bannerService.getBanner(String seq)");
		return bannerDao.getBanner(seq);
	}
}
