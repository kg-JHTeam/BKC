package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import com.bkc.subpages.brand.whybkc.vo.MaterialVO;

public interface MaterialService {
	
	public List<MaterialVO> MaterialList(MaterialVO materialVO);
	
	public MaterialVO getMaterial(int seq);
	
	public int deleteMaterial(int seq);
	
	public int insertMaterial(MaterialVO materialVO);
	
	public int updateMaterial(MaterialVO materialVO);
}
