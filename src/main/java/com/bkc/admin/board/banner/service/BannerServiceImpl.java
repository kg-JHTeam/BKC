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
		return bannerDao.getBannerList();
	}

	@Override
	public List<BannerVO> getBannerUsedList() {
		return bannerDao.getBannerUsedList();
	}
	
	@Override
	public BannerVO getBanner(int img_seq) {
		return bannerDao.getBanner(img_seq);
	}

	@Override
	public int changeStatus(int img_seq) {
		return bannerDao.changeStatus(img_seq);		
	}

	@Override
	public int deleteBanner(int img_seq) {
		return bannerDao.deleteBanner(img_seq);		
	}

	@Override
	public int insertBanner(BannerVO vo) {
		return bannerDao.insertBanner(vo);				
	}

	@Override
	public int updateBanner(BannerVO vo) {
		return bannerDao.updateBanner(vo);
	}
	
}
