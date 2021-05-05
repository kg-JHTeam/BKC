package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.delivery.dao.OrderDAO;
import com.bkc.delivery.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDao;
	
	@Override
	@Transactional
	public int insertOrder(OrderVO order) {
		return orderDao.insertOrder(order);
	}

	@Override
	@Transactional
	public OrderVO getOrder(int order_serial) {
		return orderDao.getOrder(order_serial);
	}

	@Override
	@Transactional
	public List<OrderVO> getUserOrderList(String userid) {
		return orderDao.getUserOrderList(userid);
	}

	@Override
	@Transactional
	public void updateProductSerial(OrderVO order) {
		orderDao.updateProductSerial(order);
	}

	@Override
	@Transactional
	public List<OrderVO> getAllOrderList() {
		return orderDao.getAllOrderList();
	}

	@Override
	@Transactional
	public List<OrderVO> getAllOrderListByOrderStatus(int order_status) {
		return orderDao.getAllOrderListByOrderStatus(order_status);
	}

	@Override
	@Transactional
	public List<OrderVO> getNotDeliveryUserOrderList(String userid) {
		return orderDao.getNotDeliveryUserOrderList(userid);
	}

}
