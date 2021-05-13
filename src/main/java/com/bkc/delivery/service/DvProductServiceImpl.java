package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.delivery.dao.DvProductDAO;
import com.bkc.delivery.vo.DvProductVO;

@Service
public class DvProductServiceImpl implements DvProductService {
	@Autowired
	private DvProductDAO dao;

	// 치킨메뉴
	@Override
	@Transactional
	public List<DvProductVO> getChickenMenudv() {
		return dao.getChickenMenudv();
	}

	// 사이드메뉴
	@Override
	@Transactional
	public List<DvProductVO> getSideMenudv() {
		return dao.getSideMenudv();
	}

	@Override
	@Transactional
	public List<DvProductVO> getBeerZonedv() {
		return dao.getBeerZonedv();
	}

	@Override
	@Transactional
	public List<DvProductVO> getNewdv() {
		return dao.getNewdv();
	}
}
