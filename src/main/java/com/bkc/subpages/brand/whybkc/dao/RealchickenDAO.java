package com.bkc.subpages.brand.whybkc.dao;

import java.util.List;

import com.bkc.subpages.brand.whybkc.vo.RealchickenVO;

public interface RealchickenDAO {
	
	public List<RealchickenVO> RealchickenList(RealchickenVO realchickenVO);
	
	public RealchickenVO getRealchicken(int seq);
	
	public int deleteRealchicken(int seq);
	
	public int insertRealchicken(RealchickenVO realchickenVO);
	
	public int updateRealchicken(RealchickenVO realchickenVO);
}
