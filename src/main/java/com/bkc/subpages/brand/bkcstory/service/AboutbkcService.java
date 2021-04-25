package com.bkc.subpages.brand.bkcstory.service;

import java.util.List;

import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

public interface AboutbkcService {
	
	public List<AboutbkcVO> AboutbkcList(AboutbkcVO aboutbkcVO);
	
	public AboutbkcVO getAboutbkc(int seq);
	
	public int deleteAboutbkc(int seq);
	
	public int insertAboutbkc(AboutbkcVO aboutbkcVO);
	
	public int updateAboutbkc(AboutbkcVO aboutbkcVO);
}
