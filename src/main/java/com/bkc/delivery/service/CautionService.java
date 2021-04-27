package com.bkc.delivery.service;

import java.util.List;

import com.bkc.delivery.vo.CautionVO;

public interface CautionService {
	
	public List<CautionVO> CautionList(CautionVO cautionVO);
	
	public int CautionInsert(CautionVO cautionVO);
	
	public int CautionDelete(int seq);
	
	public int CautionUpdate(CautionVO cautionVO);
	
	public CautionVO getCaution(int seq);
}
