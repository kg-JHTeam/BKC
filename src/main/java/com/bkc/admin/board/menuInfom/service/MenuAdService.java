package com.bkc.admin.board.menuInfom.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.banner.vo.BannerVO;
import com.bkc.admin.board.menuInfom.vo.MenuAdVO;

@Service
public interface MenuAdService {
	// 전체 메뉴 조회
	public List<MenuAdVO> getMenuAdList();

	// 메뉴 상세 출력
	public MenuAdVO getMenuAd(int product_serial); // seq받아서 출력

	
}
