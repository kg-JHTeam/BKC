package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.delivery.dao.OrderDAO;
import com.bkc.delivery.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDao;
	
	@Override
	public int insertOrder(OrderVO order) {
		return orderDao.insertOrder(order);
	}

	@Override
	public OrderVO getOrder(int order_serial) {
		return orderDao.getOrder(order_serial);
	}

	@Override
	public List<OrderVO> getUserOrderList(String userid) {
		return orderDao.getUserOrderList(userid);
	}

	@Override
	public void updateProductSerial(OrderVO order) {
		orderDao.updateProductSerial(order);
	}
}
