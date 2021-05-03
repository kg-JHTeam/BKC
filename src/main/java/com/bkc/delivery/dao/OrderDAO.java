package com.bkc.delivery.dao;

import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderVO;

@Repository
public interface OrderDAO {
	public int insertOrder(OrderVO order);

	public OrderVO getOrder(int order_serial);

}
