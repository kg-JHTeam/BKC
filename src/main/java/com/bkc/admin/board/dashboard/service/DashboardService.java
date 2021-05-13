package com.bkc.admin.board.dashboard.service;

import com.bkc.admin.board.dashboard.vo.TotalChartDataVO;

import java.util.List;
import java.util.Map;

public interface DashboardService {

    public List<TotalChartDataVO> getTotalChartData(Map<String, Object> param);
    
    public List<TotalChartDataVO> getTotalChartData2(Map<String, Object> param);
}
