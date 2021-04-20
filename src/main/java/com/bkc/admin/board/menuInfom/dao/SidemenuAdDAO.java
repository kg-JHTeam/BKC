package com.bkc.admin.board.menuInfom.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.admin.board.menuInfom.vo.SidemenuAdVO;

@Repository
public interface SidemenuAdDAO {
	
	// 메뉴
	public List<SidemenuAdVO> getSidemenuAdList();

	// 메뉴 상세 조회
	public SidemenuAdVO getSidemenuAd(int product_serial);
	
	public List<SidemenuAdVO> getSidemenuSaleList();

	public int changesStatus(int product_serial);

	public int deleteSidemenu(int product_serial);

	public int updateSidemenu(int product_serial);
	
	public int insertSidemenu(int product_serial);
	

}
