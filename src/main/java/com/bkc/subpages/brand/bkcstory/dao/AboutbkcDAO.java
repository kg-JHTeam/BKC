package com.bkc.subpages.brand.bkcstory.dao;

import java.util.List;

import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;


public interface AboutbkcDAO {
	
	public List<AboutbkcVO> AboutbkcList(AboutbkcVO aboutbkcVO);
	
	public AboutbkcVO getAboutbkc(int seq);
	
	public int deleteAboutbkc(int seq);
	
	public int insertAboutbkc(AboutbkcVO aboutbkcVO);
	
	public int updateAboutbkc(AboutbkcVO aboutbkcVO);
}
