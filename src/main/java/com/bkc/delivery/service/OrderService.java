package com.bkc.delivery.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.delivery.vo.OrderVO;

@Service
public interface OrderService {

	public int insertOrder(OrderVO order);

	public OrderVO getOrder(int order_serial);

	public List<OrderVO> getUserOrderList(String userid);

	public void updateProductSerial(OrderVO order);

	public List<OrderVO> getAllOrderList();

}
