package com.bkc.admin.statistic.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bkc.admin.statistic.vo.StatisticVO;

@Service
public interface StatisticService {
	
	//매장별 판매 목록
	public List<StatisticVO> storeSaleList(StatisticVO statvo);

	//매장별 판매 차트
	public List<StatisticVO> storeSaleChart(Map<String, Object> param);
	
	//월별 판매 목록
	public List<StatisticVO> monthSaleList(StatisticVO statvo);
	
	//월별 판매 차트
	public List<StatisticVO> monthSaleChart(Map<String, Object> param);
	
	//월별 매출 합계
	public int getMonthTotal();
	
	//일별 매출 합계
	public int getDayTotal();
	
	//일별 판매 목록
	public List<StatisticVO> daySaleList();
	
	//일별 판매 차트
	public List<StatisticVO> daySaleChart();
	
	//제품별 판매 목록
	public List<StatisticVO> productSaleList();
	
	//제품별 판매 차트
	public List<StatisticVO> productSaleChart(Map<String, Object> param);
	
	//카테고리별 판매 차트
	public List<StatisticVO> CategorySaleChart(Map<String, Object> param);
}
