package com.bkc.delivery.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.delivery.vo.OrderDetailVO;

@Service
public interface OrderDetailService {

	public void insertOrderDetail(OrderDetailVO orderDetail);

	public List<OrderDetailVO> getOrderDetailListByOrderSerial(int order_serial);

	public List<OrderDetailVO> getBestMenu();
}
