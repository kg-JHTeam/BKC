package com.bkc.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertOrder(OrderVO order) {
		System.out.println(order.toString());
		sqlSession.insert("insertOrder", order);
		return order.getOrder_serial();
	}
}
