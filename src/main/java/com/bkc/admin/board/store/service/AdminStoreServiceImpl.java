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
	public StoreVO getAdStore(String store_name) {
		return adStoreDao.getAdStore(store_name);
	}

	@Override
	public int adinsertStore(StoreVO store) {
		return adStoreDao.adinsertStore(store);
	}

	@Override
	public int adupdateStore(StoreVO store) {
		return adStoreDao.adupdateStore(store);
	}

	@Override
	public int newStatus(String store_name) {
		return adStoreDao.newStatus(store_name);
	}

	@Override
	public int deleteStore(String store_name) {
		return adStoreDao.deleteStore(store_name);
	}

}
