package com.bkc.subpages.brand.bkcstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.subpages.brand.bkcstory.dao.AboutbkcDAO;
import com.bkc.subpages.brand.bkcstory.vo.AboutbkcVO;
import com.bkc.subpages.brand.bkcstory.vo.HistoryVO;

@Service
public class AboutbkcServiceImpl implements AboutbkcService{
	
	@Autowired
	private AboutbkcDAO dao;
	
	@Override
	@Transactional
	public List<AboutbkcVO> AboutbkcList(AboutbkcVO aboutbkcVO){
		return dao.AboutbkcList(aboutbkcVO);
	}
	
	@Override
	@Transactional
	public AboutbkcVO getAboutbkc(int seq) {
		return dao.getAboutbkc(seq);
	}
	
	@Override
	@Transactional
	public int deleteAboutbkc(int seq) {
		return dao.deleteAboutbkc(seq);
	}
	
	@Override
	@Transactional
	public int insertAboutbkc(AboutbkcVO aboutbkcVO) {
		return dao.insertAboutbkc(aboutbkcVO);
	}
	
	@Override
	@Transactional
	public int updateAboutbkc(AboutbkcVO aboutbkcVO) {
		return dao.updateAboutbkc(aboutbkcVO);
	}
}
