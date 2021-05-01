package com.bkc.menuInform.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.menuInform.vo.ProductVO;

@Service
public interface ProductService {

	//사이드메뉴 리스트
	public List<ProductVO> getSidemenuList();
	//사이드메뉴 디테일
	public ProductVO getSidemenu(int product_serial);
	//치킨메뉴리스트
	public List<ProductVO> getChickenMenuList();
	//치킨메뉴 디테일
	public ProductVO getChickenMenu(int product_serial);
	//비어존 리스트
	public List<ProductVO> getBeerzoneList();
	//비어존 디테일
	public ProductVO getBeerzone(int product_serial);
	//신메뉴 리스트
	public List<ProductVO> getNewmenuList();
	//신메뉴 디테일
	public ProductVO getNewmenu(int product_serial);
	
	public ProductVO getMenuBySerial(int product_serial);
}
