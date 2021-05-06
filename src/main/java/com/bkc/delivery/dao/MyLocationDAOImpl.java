package com.bkc.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.MyLocationVO;
import com.bkc.event.vo.StoreVO;

@Repository
public class MyLocationDAOImpl implements MyLocationDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MyLocationVO> getLocaList(String userid) {
		return sqlSession.selectList("getLocaList", userid);
	}
	
	@Override
	public List<MyLocationVO> newLocaList(String userid) {
		return sqlSession.selectList("newLocaList", userid);
	}

	@Override
	public int insertLoca(MyLocationVO loca) {
		return sqlSession.insert("insertLoca", loca);
	}

	@Override
	public int getCountLoca(String userid) {
		return sqlSession.selectOne("getCountLoca", userid);
	}

	@Override
	public int deleteLoca(int addr_seq) {
		return sqlSession.delete("deleteLoca", addr_seq);
	}

	@Override
	public int insertLocaOne(MyLocationVO loca) {
		return sqlSession.insert("insertLocaOne", loca);
	}

	@Override
	public MyLocationVO getLocaOne(String userid) {
		return sqlSession.selectOne("getLocaOne", userid);
	}

	@Override
	public int updateLocaOne(MyLocationVO loca) {
		return sqlSession.update("updateLocaOne", loca);
	}
	
	@Override
	public int insertStore(MyLocationVO loca) {
		return sqlSession.insert("insertStore", loca);
	}

	@Override
	public int updateStore(MyLocationVO loca) {
		return sqlSession.update("updateStore", loca);
	}
	
	@Override
	public StoreVO selectStore(StoreVO store) {
		return sqlSession.selectOne("selectStore", store);
	}
}
