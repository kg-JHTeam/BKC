package com.bkc.admin.menuInform.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.ProductVO;

@Repository
public interface AdminMenuDAO {
	// 전체메뉴 조회
	public List<ProductVO> getallList();

	// 치킨메뉴 조회
	public List<ProductVO> getchickenList();

	// 비어존메뉴조회
	public List<ProductVO> getbeerList();

	// 사이드메뉴조회
	public List<ProductVO> getsideList();

	// 신메뉴조회
	public List<ProductVO> getnewList();

	// 메뉴상태변경
	public int changeUseStatus(int product_serial);

	// 메뉴상세
	public ProductVO getMenu(int product_serial);

	// 메뉴삭제
	public int deleteMenu(int product_serial);

	// 메뉴등록
	public int insertMenu(ProductVO vo);

	// 메뉴 이미지 등록
	public int insertMenuimg(ProductVO vo);

	// 메뉴수정
	public int updateMenu(ProductVO vo);

	// 메뉴이미지 수정
	public int updateMenuimg(ProductVO vo);

}
