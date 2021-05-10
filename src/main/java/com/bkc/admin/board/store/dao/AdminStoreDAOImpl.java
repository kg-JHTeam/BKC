package com.bkc.admin.board.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.event.vo.StoreVO;

@Repository
public class AdminStoreDAOImpl implements AdminStoreDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StoreVO> getAdStoreList(StoreVO store) {
		return sqlSession.selectList("getAdStoreList", store);
	}

	@Override
	public StoreVO getAdStore(String store_name) {
		return sqlSession.selectOne("getAdStore", store_name);
	}

	@Override
	public int adinsertStore(StoreVO store) {
		return sqlSession.insert("adinsertStore", store);
	}

	@Override
	public int adupdateStore(StoreVO store) {
		return sqlSession.insert("adupdateStore", store);
	}

	@Override
	public int newStatus(String store_name) {
		return sqlSession.update("newStatus", store_name);
	}

	@Override
	public int deleteStore(String store_name) {
		return sqlSession.delete("deleteStore", store_name);
	}

}
