package com.bkc.subpages.brand.whybkc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.subpages.brand.whybkc.vo.MaterialVO;

@Repository
public class MaterialDAOImpl implements MaterialDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MaterialVO> MaterialList(MaterialVO materialVO){
		return sqlSession.selectList("MaterialList", materialVO);
	}
	
	@Override
	public MaterialVO getMaterial(int seq) {
		return sqlSession.selectOne("getMaterial", seq);
	}
	
	@Override
	public int deleteMaterial(int seq) {
		return sqlSession.insert("deleteMaterial", seq);
	}
	
	@Override
	public int insertMaterial(MaterialVO materialVO) {
		return sqlSession.insert("insertMaterial", materialVO);
	}
	
	@Override
	public int updateMaterial(MaterialVO materialVO) {
		return sqlSession.insert("updateMaterial", materialVO);
	}
}
