package com.bkc.admin.statistic.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.admin.statistic.vo.StatisticVO;

@Repository
public class StatisticDAOImpl implements StatisticDAO{
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<StatisticVO> storeSaleList(StatisticVO statvo) {
		return sqlSession.selectList("storeSaleList", statvo);
	}

	@Override
	public List<StatisticVO> storeSaleChart(Map<String, Object> param) {
		return sqlSession.selectList("storeSaleChart", param);
	}

	
	@Override
	public List<StatisticVO> monthSaleList(StatisticVO statvo) {
		return sqlSession.selectList("monthSaleList", statvo);
	}

	@Override
	public List<StatisticVO> monthSaleChart(Map<String, Object> param) {
		return sqlSession.selectList("monthSaleChart", param);
	}
	
	@Override
	public int getMonthTotal() {
		return sqlSession.selectOne("getMonthTotal");
	}
	
	@Override
	public int getDayTotal() {
		return sqlSession.selectOne("getDayTotal");
	}

	@Override
	public List<StatisticVO> daySaleList() {
		return sqlSession.selectList("daySaleList");
	}

	@Override
	public List<StatisticVO> daySaleChart() {
		return sqlSession.selectList("daySaleChart");
	}

	@Override
	public List<StatisticVO> productSaleList() {
		return sqlSession.selectList("productSaleList");
	}

	@Override
	public List<StatisticVO> productSaleChart(Map<String, Object> param) {
		return sqlSession.selectList("productSaleChart", param);
	}

	@Override
	public List<StatisticVO> CategorySaleChart(Map<String, Object> param) {
		return sqlSession.selectList("categorySaleChart", param);
	}


}
