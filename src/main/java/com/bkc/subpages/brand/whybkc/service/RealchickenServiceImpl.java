package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.subpages.brand.whybkc.dao.RealchickenDAO;
import com.bkc.subpages.brand.whybkc.vo.RealchickenVO;

@Service
public class RealchickenServiceImpl implements RealchickenService{
	
	@Autowired
	private RealchickenDAO dao;
	
	@Override
	@Transactional
	public List<RealchickenVO> RealchickenList(RealchickenVO realchickenVO){
		return dao.RealchickenList(realchickenVO);
	}
	
	@Override
	@Transactional
	public RealchickenVO getRealchicken(int seq) {
		return dao.getRealchicken(seq);
	}
	
	@Override
	@Transactional
	public int deleteRealchicken(int seq) {
		return dao.deleteRealchicken(seq);
	}
	
	@Override
	@Transactional
	public int insertRealchicken(RealchickenVO realchickenVO) {
		return dao.insertRealchicken(realchickenVO);
	}
	
	@Override
	@Transactional
	public int updateRealchicken(RealchickenVO realchickenVO) {
		return dao.updateRealchicken(realchickenVO);
	}
}
