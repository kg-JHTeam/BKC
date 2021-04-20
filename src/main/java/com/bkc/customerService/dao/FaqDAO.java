package com.bkc.customerService.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.FaqVO;

@Repository
public interface FaqDAO {
	//게시판 리스트
	public List<FaqVO> FaqList(FaqVO faqVO);
	
	public int FaqTotalCnt(FaqVO faqVO);
	
	public List<FaqVO> AdminFaqList(FaqVO faqVO);
}
