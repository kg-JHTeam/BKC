package com.bkc.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderDetailVO;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertOrderDetail(OrderDetailVO orderDetail) {
		sqlSession.insert("insertOrderDetail", orderDetail);
	}

	@Override
	public List<OrderDetailVO> getOrderDetailListByOrderSerial(int order_serial) {
		return sqlSession.selectList("getOrderDetailListByOrderSerial", order_serial);
	}

	@Override
	public List<OrderDetailVO> getBestMenu() {
		return sqlSession.selectList("getBestMenu");
	}

	
}
