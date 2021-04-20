package com.bkc.admin.board.menuInfom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.menuInfom.dao.SidemenuAdDAO;
import com.bkc.admin.board.menuInfom.vo.SidemenuAdVO;

@Service
public class SidemenuServiceImpl implements SidemenuAdService {
	@Autowired
	private SidemenuAdDAO sidemenuDao;

	@Override
	public List<SidemenuAdVO> getSidemenuAdList() {
		
		return sidemenuDao.getSidemenuAdList();
	}

	@Override
	public SidemenuAdVO getSidemenuAd(int product_serial) {
		
		return sidemenuDao.getSidemenuAd(product_serial);
	}

	@Override
	public List<SidemenuAdVO> getSidemenuSaleList() {
		
		return sidemenuDao.getSidemenuSaleList();
	}

	@Override
	public int changeStatus(int product_serial) {
		
		return sidemenuDao.changesStatus(product_serial);
	}

	@Override
	public int deleteSidemenu(int product_serial) {
		
		return sidemenuDao.deleteSidemenu(product_serial);
	}

	@Override
	public int insertSidemenu(int product_serial) {
	
		return sidemenuDao.insertSidemenu(product_serial);
	}

	@Override
	public int updateSidemenu(int product_serial) {
		
		return sidemenuDao.updateSidemenu(product_serial);
	}

	
}
