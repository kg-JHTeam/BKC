package com.bkc.delivery.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderVO;

@Repository
public interface OrderDAO {

	public int insertOrder(OrderVO order);

	public OrderVO getOrder(int order_serial);

	public List<OrderVO> getUserOrderList(String userid);

	public List<OrderVO> getAllOrderList();

	public void updateProductSerial(OrderVO order);

	public List<OrderVO> getAllOrderListByOrderStatus(int order_status);

	public List<OrderVO> getNotDeliveryUserOrderList(String userid);

	public int cancelOrder(int order_serial);

	public int getTotalSales();

	public List<OrderVO> getTotalSalesFromStore();

	public List<OrderVO> getAllOrderListReceipt();
}
