package com.bkc.menuInform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bkc.menuInform.dao.ProductDAO;
import com.bkc.menuInform.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDao;

	@Autowired
	public void setSidemenuDao(ProductDAO productDao) {
		this.productDao = productDao;
	}
	
	@Autowired
	public void setChickenMenuDao(ProductDAO productDao) {
		this.productDao = productDao;
	}
	
	//사이드메뉴 디테일	
	@Override
	public ProductVO getSidemenu(int product_serial) {
		return productDao.getSidemenu(product_serial);
	}
	
	//사이드메뉴 리스트
	@Override
	public List<ProductVO> getSidemenuList() {
		return productDao.getSidemenuList();
	}
	
	//치킨메뉴 리스트
	@Override
	public List<ProductVO> getChickenMenuList() {
		return productDao.getChickenMenuList();
	}
	
	//치킨메뉴디테일
	@Override
	public ProductVO getChickenMenu(int product_serial) {
		return productDao.getChickenMenu(product_serial);
	}
	
	//비어존 리스트
	@Override
	public List<ProductVO> getBeerzoneList() {
		return productDao.getBeerzoneList();
	}
	
	//비어존 디테일
	@Override
	public ProductVO getBeerzone(int product_serial) {
		return  productDao.getBeerzone(product_serial);
	}
	
	//신메뉴 리스트
	@Override
	public List<ProductVO> getNewmenuList() {
		return  productDao.getNewmenuList();
	}
	
	//신메뉴디테일
	@Override
	public ProductVO getNewmenu(int product_serial) {
		return productDao.getNewmenu(product_serial);
	}
	
	@Override
	public ProductVO getMenuBySerial(int product_serial) {
		return productDao.getMenuBySerial(product_serial);
	}

}
