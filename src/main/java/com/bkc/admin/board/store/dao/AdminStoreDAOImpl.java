package com.bkc.admin.board.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.event.vo.StoreVO;

@Repository
public class AdminStoreDAOImpl implements AdminStoreDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StoreVO> getAdStoreList(StoreVO store) {
		return sqlSession.selectList("getAdStoreList", store);
	}

	@Override
	public StoreVO getAdStore(int store_serial) {
		return sqlSession.selectOne("getAdStore", store_serial);
	}

	@Override
	public int insertStore(StoreVO store) {
		return sqlSession.insert("insertStore", store);
	}

	@Override
	public int updateStore(StoreVO store) {
		return sqlSession.insert("updateStore", store);
	}

	@Override
	public int newStatus(int store_serial) {
		return sqlSession.update("newStatus", store_serial);
	}

	@Override
	public int deleteStore(int store_serial) {
		return sqlSession.delete("deleteStore", store_serial);
	}

}
