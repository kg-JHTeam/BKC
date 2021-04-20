package com.bkc.menuInform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.menuInform.dao.ChickenMenuDAO;
import com.bkc.menuInform.vo.ChickenMenuVO;

@Service
public class ChickenMenuServiceImpl implements ChickenMenuService {
	private ChickenMenuDAO chickenmenuDao;
	
	@Autowired
	public void setChickenmenuDao(ChickenMenuDAO chickenmenuDao) {
		this.chickenmenuDao = chickenmenuDao;
	}


	@Override
	public List<ChickenMenuVO> getChickenMenu() {
		
		return chickenmenuDao.getChickenMenu();
	}

}
