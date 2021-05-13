package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.delivery.dao.CautionDAO;
import com.bkc.delivery.vo.CautionVO;

@Service
public class CautionServiceImpl implements CautionService{
	
	@Autowired
	private CautionDAO dao;
	
	@Override
	@Transactional
	public List<CautionVO> CautionList(CautionVO cautionVO){
		return dao.CautionList(cautionVO);
	}
	
	@Override
	@Transactional
	public int CautionInsert(CautionVO cautionVO) {
		return dao.CautionInsert(cautionVO);
	}
	
	@Override
	@Transactional
	public int CautionDelete(int seq) {
		return dao.CautionDelete(seq);
	}
	
	@Override
	@Transactional
	public int CautionUpdate(CautionVO cautionVO) {
		return dao.CautionUpdate(cautionVO);
	}
	
	@Override
	@Transactional
	public CautionVO getCaution(int seq) {
		return dao.getCaution(seq);
	}
}
