package com.bkc.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.delivery.dao.OrderDetailDAO;
import com.bkc.delivery.vo.OrderDetailVO;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailDAO orderDetailDao;
	
	@Override
	public void insertOrderDetail(OrderDetailVO orderDetail) {
		orderDetailDao.insertOrderDetail(orderDetail);
	}

}
