package com.bkc.admin.menuInform.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.menuInform.dao.AdminMenuDAO;
import com.bkc.menuInform.vo.ProductVO;

@Service
public class AdminMenuServiceImpl implements AdMenuService {

	@Autowired
	private AdminMenuDAO adminmenuDao;

	// 전체메뉴리스트
	@Override
	public List<ProductVO> getallList() {
		return adminmenuDao.getallList();
	}

	// 치킨메뉴 리스트
	@Override
	public List<ProductVO> getchickenList() {
		return adminmenuDao.getchickenList();
	}

	// 비어존메뉴리스트
	@Override
	public List<ProductVO> getbeerList() {
		return adminmenuDao.getbeerList();
	}

	// 사이드메뉴리스트
	@Override
	public List<ProductVO> getsideList() {
		return adminmenuDao.getsideList();
	}

	// 신메뉴리스트
	@Override
	public List<ProductVO> getnewList() {
		return adminmenuDao.getnewList();
	}

	// 판매중 미판매중 변경
	@Override
	public int changeUseStatus(int product_serial) {
		return adminmenuDao.changeUseStatus(product_serial);
	}

	// 수정페이지
	@Override
	public ProductVO getMenu(int product_serial) {
		return adminmenuDao.getMenu(product_serial);
	}

	//메뉴삭제
	@Override
	public int deleteMenu(int product_serial) {
		return adminmenuDao.deleteMenu(product_serial);
	}

	//메뉴추가
	@Override
	public int insertMenu(ProductVO vo) {
		int result = adminmenuDao.insertMenu(vo);
		if (result == 1) {
			result = adminmenuDao.insertMenuimg(vo);
		}
		return result;
	}

	//메뉴수정
	@Override
	public int updateMenu(ProductVO vo) {
		int result = adminmenuDao.updateMenu(vo);
		if (result == 1) {
			result = adminmenuDao.updateMenuimg(vo);
		}
		return result;
	}
}
