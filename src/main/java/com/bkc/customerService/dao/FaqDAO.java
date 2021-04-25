package com.bkc.customerService.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.customerService.vo.FaqVO;

@Repository
public interface FaqDAO {
	//게시판
	public List<FaqVO> FaqList(FaqVO faqVO);
	
	public int FaqTotalCnt(FaqVO faqVO);
	
	//ad게시판
	public List<FaqVO> AdminFaqList(FaqVO faqVO);
	
	public int FaqInsert(FaqVO faqVO);
	
	public int FaqDelete(int seq);
	
	public FaqVO getFaq(int seq);
	
	public int updateFaq(FaqVO faqVO);
}
