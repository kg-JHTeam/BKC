package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.subpages.brand.whybkc.dao.MaterialDAO;
import com.bkc.subpages.brand.whybkc.vo.MaterialVO;

@Service
public class MaterialServiceImpl implements MaterialService{
	
	@Autowired
	private MaterialDAO dao;
	
	@Override
	@Transactional
	public List<MaterialVO> MaterialList(MaterialVO materialVO){
		return dao.MaterialList(materialVO);
	}
	
	@Override
	@Transactional
	public MaterialVO getMaterial(int seq) {
		return dao.getMaterial(seq);
	}
	
	@Override
	@Transactional
	public int deleteMaterial(int seq) {
		return dao.deleteMaterial(seq);
	}
	
	@Override
	@Transactional
	public int insertMaterial(MaterialVO materialVO) {
		return dao.insertMaterial(materialVO);
	}
	
	@Override
	@Transactional
	public int updateMaterial(MaterialVO materialVO) {
		return dao.updateMaterial(materialVO);
	}
}
