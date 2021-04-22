package com.bkc.admin.board.menuInfom.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.admin.board.menuInfom.vo.MenuAdVO;

@Repository
public interface MenuAdDAO {
	
	// 메뉴
	public List<MenuAdVO> getMenuAdList();

	// 메뉴 상세 조회
	public MenuAdVO getMenuAd(int product_serial);
	
	

}
