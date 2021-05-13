package com.bkc.admin.board.dashboard.dao;

import com.bkc.admin.board.dashboard.vo.TotalChartDataVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DashboardDAOImpl implements DashboardDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<TotalChartDataVO> getTotalChartData(Map<String, Object> param) {
        return sqlSession.selectList("getTotalChartData", param);
    }

	@Override
	public List<TotalChartDataVO> getTotalChartData2(Map<String, Object> param) {
		return sqlSession.selectList("getTotalChartData2", param);
	}
}
