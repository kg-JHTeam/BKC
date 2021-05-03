package com.bkc.delivery.service;

import org.springframework.stereotype.Service;

import com.bkc.delivery.vo.OrderVO;

@Service
public interface OrderService {

	public int insertOrder(OrderVO order);

	public OrderVO getOrder(int order_serial);

}
