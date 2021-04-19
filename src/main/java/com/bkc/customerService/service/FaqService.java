package com.bkc.customerService.service;

import java.util.List;

import com.bkc.customerService.vo.FaqVO;

public interface FaqService {
	
	public List<FaqVO> FaqList(FaqVO faqVO);
	
	public int FaqTotalCnt(FaqVO faqVO);
	
	public List<FaqVO> AdminFaqList(FaqVO faqVO);
}
