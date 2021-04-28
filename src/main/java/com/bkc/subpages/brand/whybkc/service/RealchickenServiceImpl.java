package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.subpages.brand.whybkc.dao.RealchickenDAO;
import com.bkc.subpages.brand.whybkc.vo.RealchickenVO;

@Service
public class RealchickenServiceImpl implements RealchickenService{
	
	@Autowired
	private RealchickenDAO dao;
	
	@Override
	public List<RealchickenVO> RealchickenList(RealchickenVO realchickenVO){
		return dao.RealchickenList(realchickenVO);
	}
	
	@Override
	public RealchickenVO getRealchicken(int seq) {
		return dao.getRealchicken(seq);
	}
	
	@Override
	public int deleteRealchicken(int seq) {
		return dao.deleteRealchicken(seq);
	}
	
	@Override
	public int insertRealchicken(RealchickenVO realchickenVO) {
		return dao.insertRealchicken(realchickenVO);
	}
	
	@Override
	public int updateRealchicken(RealchickenVO realchickenVO) {
		return dao.updateRealchicken(realchickenVO);
	}
}
