package com.bkc.admin.board.dashboard.service;

import com.bkc.admin.board.dashboard.dao.DashboardDAO;
import com.bkc.admin.board.dashboard.vo.TotalChartDataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DashboardServiceImpl implements DashboardService{

    @Autowired
    private DashboardDAO dao;

    @Override
    public List<TotalChartDataVO> getTotalChartData(Map<String, Object> param) {
        return dao.getTotalChartData(param);
    }

	@Override
	public List<TotalChartDataVO> getTotalChartData2(Map<String, Object> param) {
		return dao.getTotalChartData2(param);
	}

}
