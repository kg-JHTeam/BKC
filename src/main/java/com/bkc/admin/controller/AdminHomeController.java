package com.bkc.admin.controller;

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

import com.bkc.admin.board.dashboard.service.DashboardService;
import com.bkc.admin.board.dashboard.vo.TotalChartDataVO;
import com.bkc.admin.statistic.service.StatisticService;
import com.bkc.admin.statistic.vo.ChartData;
import com.bkc.admin.statistic.vo.StatisticVO;
import com.bkc.delivery.service.OrderDetailService;
import com.bkc.delivery.service.OrderService;
import com.bkc.delivery.vo.OrderDetailVO;
import com.bkc.delivery.vo.OrderVO;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;
import com.bkc.utils.DateUtils;

@Controller
public class AdminHomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StatisticService statService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private DashboardService dashboardService;
	
	
	@RequestMapping(value = "/admin.ad", method = RequestMethod.GET)
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping(value = "/goAdminPage.ad", method = RequestMethod.GET)
	public String goAdminPage(Model model) {
		
		//User리스트
		List<UserVO> users = userService.getUserList();
		model.addAttribute("users", users);
		
		//회원가입한 인원 수
		int userCount =  users.size();
		model.addAttribute("userCount", userCount);
		
		//총 판매금액 - 주문완료 된 orderlist중에서
		int totalSales = orderService.getTotalSales();
		model.addAttribute("totalSales", totalSales);
		
		//Best Store - 가장 매출이 높은 매장
		List<OrderVO> sumSalesByStores = orderService.getTotalSalesFromStore();
		String bestStore = sumSalesByStores.get(0).getStore_name();
		model.addAttribute("bestStore", bestStore);
		
		//가장 많이 팔린 메뉴 

		List<OrderDetailVO> bestMenus = orderDetailService.getBestMenu();
		String bestMenu = bestMenus.get(0).getProduct_name();
		model.addAttribute("bestMenu",bestMenu);
		
		return "admin/dist/index";
	}
	
	
	@RequestMapping(value = "/admin/dash/chartData.ad")
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

			List<TotalChartDataVO> dataSetList = new ArrayList<TotalChartDataVO>();

			String month = "";
			for(int i = 1; i <= lastMonth; i ++) {
				TotalChartDataVO data = new TotalChartDataVO();

				if( i < 10) {
					month = year + "-0"+ i;
				}else {
					month = year + "-"+ i;
				}

				data.setX(month);
				data.setY(0);
				dataSetList.add(data);
			}

			List<TotalChartDataVO> chartData = dashboardService.getTotalChartData(param);
			List<String> labels = new ArrayList<String>();
			List<Long> data = new ArrayList<Long>();

			if(chartData != null) {

				for(int i = 0; i < dataSetList.size(); i ++) {
					TotalChartDataVO standardVO  =  dataSetList.get(i);
					labels.add(i, standardVO.getX());
					data.add(i,0L);

					for(TotalChartDataVO vo : chartData) {
						if(standardVO.getX().equals(vo.getX())) {
							data.add(i,vo.getY());
							break;
						}
					}
				}
			}

			result.put("chartLabels", labels);
			result.put("chartData", data);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	@RequestMapping(value="/admin/storelist.ad")
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

}
