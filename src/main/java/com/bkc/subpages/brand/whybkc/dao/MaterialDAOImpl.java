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
}
