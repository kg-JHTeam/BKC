package com.bkc.admin.menuInform.Service;

import java.util.List;

import com.bkc.menuInform.vo.ProductVO;

public interface AdMenuService {
	// 전체메뉴조회
	public List<ProductVO> getallList();

	// 치킨메뉴조회
	public List<ProductVO> getchickenList();

	// 비어존메뉴조회
	public List<ProductVO> getbeerList();

	// 사이드메뉴조회
	public List<ProductVO> getsideList();

	// 신메뉴 조회
	public List<ProductVO> getnewList();

	// 판매중 미판매중 변경
	public int changeUseStatus(int product_serial);

	// 메뉴 상세
	public ProductVO getMenu(int product_serial);

	// 메뉴삭제
	public int deleteMenu(int product_serial);

	// 메뉴추가
	public int insertMenu(ProductVO vo);

	// 메뉴 수정
	public int updateMenu(ProductVO vo);

}
