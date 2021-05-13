package com.bkc.delivery.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.delivery.vo.OrderVO;
import com.bkc.user.vo.CartVO;

@Service
public interface OrderService {

	public int insertOrder(OrderVO order);

	public OrderVO getOrder(int order_serial);

	public List<OrderVO> getUserOrderList(String userid);

	public void updateProductSerial(OrderVO order);

	public List<OrderVO> getAllOrderList();

	public List<OrderVO> getAllOrderListByOrderStatus(int order_status);

	public List<OrderVO> getNotDeliveryUserOrderList(String userid);

	//주문 비지니스 로직
	public int doOrder(String store_name, String address, String phonenumber, String description, String payment_type,
			int coupon_seq, int total_price,  CartVO cart);

	public int cancelOrder(int order_serial);

	public int getTotalSales();

	public List<OrderVO> getTotalSalesFromStore();

	public List<OrderVO> getAllOrderListReceipt();


}
