package com.bkc.delivery.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderVO;

@Repository
public interface OrderDAO {
	public int insertOrder(OrderVO order);

	public OrderVO getOrder(int order_serial);

	public List<OrderVO> getUserOrderList(String userid);

}
