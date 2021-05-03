package com.bkc.delivery.service;

import org.springframework.stereotype.Service;

import com.bkc.delivery.vo.OrderDetailVO;

@Service
public interface OrderDetailService {

	public void insertOrderDetail(OrderDetailVO orderDetail);
	
}
