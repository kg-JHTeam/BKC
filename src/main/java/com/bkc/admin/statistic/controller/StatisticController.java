package com.bkc.admin.statistic.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bkc.admin.statistic.service.StatisticService;
import com.bkc.admin.statistic.vo.ChartData;
import com.bkc.admin.statistic.vo.StatisticVO;
import com.bkc.utils.DateUtils;

@Controller
public class StatisticController {
	
	@Autowired
	private StatisticService statService;
	
	//차트 페이지
	@RequestMapping(value="/admin/salelist.ad", method=RequestMethod.GET)
	private String getStoreSaleList(StatisticVO statvo, Model model) {

		int month_total = statService.getMonthTotal();
		int day_total = statService.getDayTotal();
		
		model.addAttribute("month_total", month_total);	
		model.addAttribute("day_total", day_total);
		return "admin/subpages/statistic/salelist";
	}
		
	
	//매출 차트
	@RequestMapping(value="/admin/chartData.ad")
	@ResponseBody
	public Map<String, Object> getChartData(@RequestParam(name = "startDate", required = true) String startDate,
											@RequestParam(name = "endDate", required = true) String endDate) {

		Map<String, Object> result = new HashMap<>();
		Map<String, Object> param = new HashMap<>();

		param.put("startDate", startDate);
		param.put("endDate", endDate);

		try {

			String year = DateUtils.changeDateFormat(startDate, "yyyy-MM-dd", "yyyy");
			int lastMonth = Integer.parseInt(DateUtils.changeDateFormat(endDate, "yyyy-MM-dd", "MM"));

			List<StatisticVO> dataSetList = new ArrayList<StatisticVO>();

			String month = "";
			for(int i = 1; i <= lastMonth; i ++) {
				StatisticVO data = new StatisticVO();

				if( i < 10) {
					month = year + "-0"+ i;
				}else {
					month = year + "-"+ i;
				}

				data.setX(month);
				data.setY(0);
				dataSetList.add(data);
			}
			List<StatisticVO> chartData = statService.monthSaleChart(param);
			List<String> labels = new ArrayList<String>();
			List<Long> data = new ArrayList<Long>();
			List<ChartData> dataList= new ArrayList<>();

			if(chartData != null) {

				for(int i = 0; i < dataSetList.size(); i ++) {
					StatisticVO standardVO  =  dataSetList.get(i);
					labels.add(i, standardVO.getX());
					
					Long count = 0L;

					for(StatisticVO vo : chartData) {
						if(standardVO.getX().equals(vo.getX())) {
							count = vo.getY();
							break;
						}
					}										
					data.add(i,count);

					{
					ChartData d = new ChartData();
					d.setX(standardVO.getX());
					d.setyList(Arrays.asList(count));
					dataList.add(d);
					}
				}
			}

			result.put("chartLabels", labels);
			result.put("chartData", data);
			result.put("data", dataList);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping(value="/admin/chartData-month.ad")
	@ResponseBody
	public Map<String, Object> getChartDataByMongth(@RequestParam(name = "month", required = true) int durationMonth) {

		Map<String, Object> result = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		
		LocalDate now = LocalDate.now();
		LocalDate start = now.withDayOfMonth(1).minusMonths(durationMonth-1);
		LocalDate end = now.plusMonths(1).withDayOfMonth(1).minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter formatterMM = DateTimeFormatter.ofPattern("yyyy-MM");
		String startDate = start.format(formatter);
		String endDate = end.format(formatter);

		param.put("startDate", startDate);
		param.put("endDate", endDate);

		try {

			String year = DateUtils.changeDateFormat(startDate, "yyyy-MM-dd", "yyyy");
			int lastMonth = Integer.parseInt(DateUtils.changeDateFormat(endDate, "yyyy-MM-dd", "MM"));

			List<StatisticVO> dataSetList = new ArrayList<StatisticVO>();

			LocalDate current = start;
			do {

				StatisticVO data = new StatisticVO();
				data.setX(current.format(formatterMM));
				data.setY(0);
				dataSetList.add(data);
				current = current.plusMonths(1);
			}while (current.isBefore(end));
			
			
			List<StatisticVO> chartData = statService.monthSaleChart(param);
			List<String> labels = new ArrayList<String>();
			List<Long> data = new ArrayList<Long>();
			List<ChartData> dataList= new ArrayList<>();

			if(chartData != null) {

				for(int i = 0; i < dataSetList.size(); i ++) {
					StatisticVO standardVO  =  dataSetList.get(i);
					labels.add(i, standardVO.getX());
					
					Long count = 0L;

					for(StatisticVO vo : chartData) {
						if(standardVO.getX().equals(vo.getX())) {
							count = vo.getY();
							break;
						}
					}										
					data.add(i,count);

					{
					ChartData d = new ChartData();
					d.setX(standardVO.getX());
					d.setyList(Arrays.asList(count));
					dataList.add(d);
					}
				}
			}

			result.put("chartLabels", labels);
			result.put("chartData", data);
			result.put("data", dataList);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	@RequestMapping(value="/admin/chartData-store.ad")
	@ResponseBody
	public Map<String, Object> getChartDataByStore(@RequestParam(name = "month", required = true) int durationMonth) {

		Map<String, Object> result = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		
		LocalDate now = LocalDate.now();
		LocalDate start = now.withDayOfMonth(1).minusMonths(durationMonth-1);
		LocalDate end = now.plusMonths(1).withDayOfMonth(1).minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter formatterMM = DateTimeFormatter.ofPattern("yyyy-MM");
		String startDate = start.format(formatter);
		String endDate = end.format(formatter);

		param.put("startDate", startDate);
		param.put("endDate", endDate);

		try {
	
			List<StatisticVO> chartData = statService.storeSaleChart(param);
			List<String> labels = new ArrayList<String>();
			List<Long> data = new ArrayList<Long>();
			List<ChartData> dataList= new ArrayList<>();

			if(chartData != null) {

				for(StatisticVO vo: chartData)				
					{
					ChartData d = new ChartData();
					d.setX(vo.getX());
					d.setyList(Arrays.asList(vo.getY()));
					dataList.add(d);
					}
			}

			result.put("chartLabels", labels);
			result.put("chartData", data);
			result.put("data", dataList);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping(value="/admin/chartData-category.ad")
	@ResponseBody
	public Map<String, Object> getChartDataByCategory(@RequestParam(name = "month", required = true) int durationMonth) {

		Map<String, Object> result = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		
		LocalDate now = LocalDate.now();
		LocalDate start = now.withDayOfMonth(1).minusMonths(durationMonth-1);
		LocalDate end = now.plusMonths(1).withDayOfMonth(1).minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter formatterMM = DateTimeFormatter.ofPattern("yyyy-MM");
		String startDate = start.format(formatter);
		String endDate = end.format(formatter);

		param.put("startDate", startDate);
		param.put("endDate", endDate);

		try {
			List<StatisticVO> chartData = statService.CategorySaleChart(param);
			List<String> labels = new ArrayList<String>();
			List<Long> data = new ArrayList<Long>();
			List<ChartData> dataList= new ArrayList<>();

			if(chartData != null) {

				for(StatisticVO vo: chartData)				
					{
					ChartData d = new ChartData();
					d.setX(vo.getX());
					d.setyList(Arrays.asList(vo.getY()));
					dataList.add(d);
					}
			}

			result.put("chartLabels", labels);
			result.put("chartData", data);
			result.put("data", dataList);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping(value="/admin/chartData-product.ad")
	@ResponseBody
	public Map<String, Object> getChartDataByProduct(@RequestParam(name = "month", required = true) int durationMonth) {

		Map<String, Object> result = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		
		LocalDate now = LocalDate.now();
		LocalDate start = now.withDayOfMonth(1).minusMonths(durationMonth-1);
		LocalDate end = now.plusMonths(1).withDayOfMonth(1).minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter formatterMM = DateTimeFormatter.ofPattern("yyyy-MM");
		String startDate = start.format(formatter);
		String endDate = end.format(formatter);

		param.put("startDate", startDate);
		param.put("endDate", endDate);

		try {
	
			List<StatisticVO> chartData = statService.productSaleChart(param);
			List<String> labels = new ArrayList<String>();
			List<Long> data = new ArrayList<Long>();
			List<ChartData> dataList= new ArrayList<>();

			if(chartData != null) {

				for(StatisticVO vo: chartData)				
					{
					ChartData d = new ChartData();
					d.setX(vo.getX());
					d.setyList(Arrays.asList(vo.getY()));
					dataList.add(d);
					}
			}

			result.put("chartLabels", labels);
			result.put("chartData", data);
			result.put("data", dataList);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	//매장별 판매현황
	//차트 페이지
	@RequestMapping(value="/admin/storesale.ad", method=RequestMethod.GET)
	private String getStoreSale(StatisticVO statvo, Model model) {
		List<StatisticVO> storesale = statService.storeSaleList(statvo);
		
		model.addAttribute("storesale", storesale);
		return "admin/subpages/statistic/storesalelist";
	}
}
