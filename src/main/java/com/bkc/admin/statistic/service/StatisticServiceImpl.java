package com.bkc.admin.statistic.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.statistic.dao.StatisticDAO;
import com.bkc.admin.statistic.vo.StatisticVO;

@Service
public class StatisticServiceImpl implements StatisticService{
	
	@Autowired
	private StatisticDAO statDao;
	
	@Override
	public List<StatisticVO> storeSaleList(StatisticVO statvo) {
		return statDao.storeSaleList(statvo);
	}

	@Override
	public List<StatisticVO> storeSaleChart(Map<String, Object> param) {
		return statDao.storeSaleChart(param);
	}

	
	@Override
	public List<StatisticVO> monthSaleList(StatisticVO statvo) {
		return statDao.monthSaleList(statvo);
	}

	@Override
	public List<StatisticVO> monthSaleChart(Map<String, Object> param) {
		return statDao.monthSaleChart(param);
	}
	
	@Override
	public int getMonthTotal() {
		return statDao.getMonthTotal();
	}
	
	@Override
	public int getDayTotal() {
		return statDao.getDayTotal();
	}
	
	@Override
	public List<StatisticVO> daySaleList() {
		return statDao.daySaleList();
	}

	@Override
	public List<StatisticVO> daySaleChart() {
		return statDao.daySaleChart();
	}

	@Override
	public List<StatisticVO> productSaleList() {
		return statDao.productSaleList();
	}

	@Override
	public List<StatisticVO> productSaleChart(Map<String, Object> param) {
		return statDao.productSaleChart(param);
	}

	@Override
	public List<StatisticVO> CategorySaleChart(Map<String, Object> param) {
		return statDao.CategorySaleChart(param);
	}

	

	
}
