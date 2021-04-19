package com.bkc.customerService.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.customerService.dao.FaqDAO;
import com.bkc.customerService.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDAO dao;
	
	@Override
	public List<FaqVO> FaqList(FaqVO faqVO) {	
		return dao.FaqList(faqVO);
	}
	
	@Override
	public int FaqTotalCnt(FaqVO faqVO) {
		return dao.FaqTotalCnt(faqVO);
	}
}
