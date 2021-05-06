package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.delivery.dao.MyLocationDAO;
import com.bkc.delivery.vo.MyLocationVO;

@Service
public class MyLocationServiceImpl implements MyLocationService {

	@Autowired
	private MyLocationDAO locaDao;

	@Transactional
	@Override
	public List<MyLocationVO> getLocaList(String userid) {
		return locaDao.getLocaList(userid);
	}

	@Transactional
	@Override
	public List<MyLocationVO> newLocaList(String userid) {
		return locaDao.newLocaList(userid);
	}

	@Transactional
	@Override
	public int insertLoca(MyLocationVO loca) {
		return locaDao.insertLoca(loca);
	}

	@Transactional
	@Override
	public int insertLocaOne(MyLocationVO loca) {
		return locaDao.insertLocaOne(loca);
	}

	@Transactional
	@Override
	public int updateLocaOne(MyLocationVO loca) {
		return locaDao.updateLocaOne(loca);
	}

	@Transactional
	@Override
	public int getCountLoca(String userid) {
		return locaDao.getCountLoca(userid);
	}

	@Transactional
	@Override
	public int deleteLoca(int addr_seq) {
		return locaDao.deleteLoca(addr_seq);
	}

	@Transactional
	@Override
	public MyLocationVO getLocaOne(String userid) {
		return locaDao.getLocaOne(userid);
	}

}
