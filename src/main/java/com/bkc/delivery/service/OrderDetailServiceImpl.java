package com.bkc.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.delivery.dao.OrderDetailDAO;
import com.bkc.delivery.vo.OrderDetailVO;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailDAO orderDetailDao;
	
	@Transactional
	@Override
	public void insertOrderDetail(OrderDetailVO orderDetail) {
		orderDetailDao.insertOrderDetail(orderDetail);
	}

	@Transactional
	@Override
	public List<OrderDetailVO> getOrderDetailListByOrderSerial(int order_serial) {
		return orderDetailDao.getOrderDetailListByOrderSerial(order_serial);
	}

	@Transactional
	@Override
	public List<OrderDetailVO> getBestMenu() {
		return orderDetailDao.getBestMenu() ;
	}

}
