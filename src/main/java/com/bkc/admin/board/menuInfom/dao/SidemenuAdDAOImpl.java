package com.bkc.admin.board.menuInfom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.board.menuInfom.vo.SidemenuAdVO;

@Repository
public class SidemenuAdDAOImpl implements SidemenuAdDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SidemenuAdVO> getSidemenuAdList() {
		return sqlSession.selectList("getSidemenuAdList");
	}

	@Override
	public SidemenuAdVO getSidemenuAd(int product_serial) {
		return sqlSession.selectOne("getSidemenuAd", product_serial);
	}

	@Override
	public List<SidemenuAdVO> getSidemenuSaleList() {

		return sqlSession.selectList("getSidemenuSaleList");
	}

	@Override
	public int changesStatus(int product_serial) {

		return sqlSession.insert("changeStatus", product_serial);
	}

	@Override
	public int deleteSidemenu(int product_serial) {

		return sqlSession.insert("deleteSidemenu", product_serial);
	}

	@Override
	public int insertSidemenu(int product_serial) {

		return sqlSession.insert("insertSidemenu", product_serial);
	}

	@Override
	public int updateSidemenu(int product_serial) {

		return sqlSession.update("updateSidemenu", product_serial);
	}

}
