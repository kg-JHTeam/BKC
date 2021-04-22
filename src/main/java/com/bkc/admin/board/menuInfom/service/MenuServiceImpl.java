package com.bkc.admin.board.menuInfom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.menuInfom.dao.MenuAdDAO;
import com.bkc.admin.board.menuInfom.vo.MenuAdVO;

@Service
public class MenuServiceImpl implements MenuAdService {
	@Autowired
	private MenuAdDAO sidemenuDao;

	@Override
	public List<MenuAdVO>  getMenuAdList() {
		return sidemenuDao. getMenuAdList();
	}

	@Override
	public MenuAdVO getMenuAd(int product_serial) {
		return sidemenuDao.getMenuAd(product_serial);
	}



}
