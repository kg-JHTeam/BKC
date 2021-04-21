package com.bkc.admin.board.menuInfom.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.banner.vo.BannerVO;
import com.bkc.admin.board.menuInfom.vo.SidemenuAdVO;

@Service
public interface SidemenuAdService {
	// 전체 메뉴 조회
	public List<SidemenuAdVO> getSidemenuAdList();

	// 메뉴 상세 출력
	public SidemenuAdVO getSidemenuAd(int product_serial); // seq받아서 출력

	// 사용중인 메뉴 조회
	public List<SidemenuAdVO> getSidemenuSaleList();

	// 메뉴 status 변경
	public int changeStatus(int product_serial);

	// 메뉴 삭제
	public int deleteSidemenu(int product_serial);

	// 메뉴 등록
	public int insertSidemenu(int product_serial);

	// 메뉴슈정
	public int updateSidemenu(int product_serial);
}
