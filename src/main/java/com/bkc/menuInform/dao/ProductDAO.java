package com.bkc.menuInform.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.ProductVO;

@Repository
public interface ProductDAO {
	//치킨 메뉴 조회
	public List<ProductVO>getChickenMenuList();
	//치킨메뉴 상세
	public ProductVO getChickenMenu(int product_serial);
	//사이드메뉴 리스트
	public List<ProductVO>getSidemenuList();	
	//사이드메뉴상세
	public ProductVO getSidemenu(int product_serial);
	//비어존 리스트
	public List<ProductVO> getBeerzoneList();
	//비어존 디테일
	public ProductVO getBeerzone(int product_serial);
	//사이드메뉴 리스트
	public List<ProductVO> getNewmenuList();
	//사이드메뉴 디테일
	public ProductVO getNewmenu(int product_serial);
	
	public ProductVO getMenuBySerial(int product_serial);
}
