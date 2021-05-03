package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.delivery.dao.MyLocationDAO;
import com.bkc.delivery.vo.MyLocationVO;

@Service
public class MyLocationServiceImpl implements MyLocationService {
	
	@Autowired
	private MyLocationDAO locaDao;
	

	@Override
	public List<MyLocationVO> getLocaList(String userid) {
		return locaDao.getLocaList(userid);
	}
	
	
	@Override
	public List<MyLocationVO> newLocaList(String userid) {
		return locaDao.newLocaList(userid);
	}	

	@Override
	public int insertLoca(MyLocationVO loca) {
		return locaDao.insertLoca(loca);
	}

	@Override
	public int insertLocaOne(MyLocationVO loca) {
		return locaDao.insertLocaOne(loca);
	}
	
	@Override
	public int updateLocaOne(MyLocationVO loca) {
		return locaDao.updateLocaOne(loca);
	}
	
	@Override
	public int getCountLoca(String userid) {
		return locaDao.getCountLoca(userid);
	}

	@Override
	public int deleteLoca(int addr_seq) {
		return locaDao.deleteLoca(addr_seq);
	}

	@Override
	public MyLocationVO getLocaOne(String userid) {
		return locaDao.getLocaOne(userid);
	}

}
