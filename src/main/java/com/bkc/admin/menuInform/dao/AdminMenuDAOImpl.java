package com.bkc.admin.menuInform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.ProductVO;

@Repository
public class AdminMenuDAOImpl implements AdminMenuDAO {

	@Autowired
	private SqlSession sqlSession;

	// 전체조회
	@Override
	public List<ProductVO> getallList() {
		return sqlSession.selectList("getallList");
	}

	// 치킨메뉴조회
	@Override
	public List<ProductVO> getchickenList() {
		return sqlSession.selectList("getchickenList");
	}

	// 비어존메뉴조회
	@Override
	public List<ProductVO> getbeerList() {
		return sqlSession.selectList("getbeerList");
	}

	// 사이드메뉴조회
	@Override
	public List<ProductVO> getsideList() {
		return sqlSession.selectList("getsideList");
	}

	// 신메뉴조회
	@Override
	public List<ProductVO> getnewList() {
		return sqlSession.selectList("getnewList");
	}

	// 판매상태변경
	@Override
	public int changeUseStatus(int product_serial) {
		return sqlSession.insert("changeUseStatus", product_serial);
	}

	// 메뉴상세
	@Override
	public ProductVO getMenu(int product_serial) {
		return sqlSession.selectOne("getMenu", product_serial);
	}

	// 메뉴삭제
	@Override
	public int deleteMenu(int product_serial) {
		return sqlSession.insert("deleteMenu", product_serial);
	}

	// 메뉴등록
	@Override
	public int insertMenu(ProductVO vo) {
		return sqlSession.insert("insertMenu", vo);
	}

	// 메뉴 이미지 등록
	@Override
	public int insertMenuimg(ProductVO vo) {
		return sqlSession.insert("insertMenuimg", vo);
	}

	// 메뉴수정
	@Override
	public int updateMenu(ProductVO vo) {
		return sqlSession.insert("updateMenu", vo);
	}

	// 메뉴이미지 수정
	@Override
	public int updateMenuimg(ProductVO vo) {
		return sqlSession.insert("updateMenuimg", vo);
	}

}
