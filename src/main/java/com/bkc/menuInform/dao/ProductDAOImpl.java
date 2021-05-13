package com.bkc.menuInform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;

	// 사이드메뉴리스트
	@Override
	public List<ProductVO> getSidemenuList() {
		System.out.println("getSidemenuList()수행  ");
		return sqlSession.selectList("getSidemenuList");
	}
	// 사이드메뉴 상세
	@Override
	public ProductVO getSidemenu(int product_serial) {
		System.out.println("getSidemenu()수행  ");
		return sqlSession.selectOne("getSidemenu", product_serial);
	}
	// 치킨메뉴 리스트
	@Override
	public List<ProductVO> getChickenMenuList() {
		System.out.println("getChickenMenuList()수행  ");
		return sqlSession.selectList("getChickenMenuList");
	}
	// 치킨메뉴 상세
	@Override
	public ProductVO getChickenMenu(int product_serial) {
		System.out.println("getChickenMenu()수행  ");
		return sqlSession.selectOne("getChickenMenu", product_serial);
	}

	//비어존 리스트
	@Override
	public List<ProductVO> getBeerzoneList() {
		System.out.println("getBeerzoneList()수행  ");
		return sqlSession.selectList("getBeerzoneList");
	}
	//비어존 디테일
	@Override
	public ProductVO getBeerzone(int product_serial) {
		System.out.println("getBeerzone()수행  ");
		return sqlSession.selectOne("getBeerzone", product_serial);
	}

	//신메뉴리스트
	@Override
	public List<ProductVO> getNewmenuList() {
		System.out.println("getNewmenuList()수행  ");
		return sqlSession.selectList("getNewmenuList");
	}
	//신메뉴디테일
	@Override
	public ProductVO getNewmenu(int product_serial) {
		System.out.println("getNewmenu()수행  ");
		return sqlSession.selectOne("getNewmenu", product_serial);
	}

	@Override
	public ProductVO getMenuBySerial(int product_serial) {
		return sqlSession.selectOne("getMenuBySerial", product_serial);
	}
}