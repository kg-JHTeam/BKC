package com.bkc.admin.board.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.store.dao.AdminStoreDAO;
import com.bkc.event.vo.StoreVO;

@Service
public class AdminStoreServiceImpl implements AdminStoreService {

	@Autowired
	private AdminStoreDAO adStoreDao;

	@Override
	public List<StoreVO> getAdStoreList(StoreVO store) {
		return adStoreDao.getAdStoreList(store);
	}

	@Override
	public StoreVO getAdStore(int store_serial) {
		return adStoreDao.getAdStore(store_serial);
	}

	@Override
	public int insertStore(StoreVO store) {
		return adStoreDao.insertStore(store);
	}

	@Override
	public int updateStore(StoreVO store) {
		return adStoreDao.updateStore(store);
	}

	@Override
	public int newStatus(int store_serial) {
		return adStoreDao.newStatus(store_serial);
	}

	@Override
	public int deleteStore(int store_serial) {
		return adStoreDao.deleteStore(store_serial);
	}

}
