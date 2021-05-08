package com.bkc.delivery.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderDetailVO;

@Repository
public interface OrderDetailDAO {

	public void insertOrderDetail(OrderDetailVO orderDetail);

	public List<OrderDetailVO> getOrderDetailListByOrderSerial(int order_serial);

	public List<OrderDetailVO> getBestMenu();


}
