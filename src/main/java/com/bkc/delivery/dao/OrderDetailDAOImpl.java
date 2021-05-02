package com.bkc.delivery.dao;

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

	
}
