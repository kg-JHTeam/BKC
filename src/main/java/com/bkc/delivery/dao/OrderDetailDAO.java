package com.bkc.delivery.dao;

import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderDetailVO;

@Repository
public interface OrderDetailDAO {

	public void insertOrderDetail(OrderDetailVO orderDetail);

}
