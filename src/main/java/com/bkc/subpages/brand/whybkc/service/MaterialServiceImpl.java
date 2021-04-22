package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.subpages.brand.whybkc.dao.MaterialDAO;
import com.bkc.subpages.brand.whybkc.vo.MaterialVO;

@Service
public class MaterialServiceImpl implements MaterialService{
	
	@Autowired
	private MaterialDAO dao;
	
	@Override
	public List<MaterialVO> MaterialList(MaterialVO materialVO){
		return dao.MaterialList(materialVO);
	}
}
