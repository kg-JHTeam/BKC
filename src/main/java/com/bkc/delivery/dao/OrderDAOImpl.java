package com.bkc.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.delivery.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertOrder(OrderVO order) {
		System.out.println(order.toString());
		sqlSession.insert("insertOrder", order);
		return order.getOrder_serial();
	}

	@Override
	public OrderVO getOrder(int order_serial) {
		return sqlSession.selectOne("getOrder", order_serial);
	}

	@Override
	public List<OrderVO> getUserOrderList(String userid) {
		return sqlSession.selectList("getUserOrderList", userid);
	}

	@Override
	public void updateProductSerial(OrderVO order) {
		sqlSession.insert("updateProductSerial", order);
	}

	@Override
	public List<OrderVO> getAllOrderList() {
		return sqlSession.selectList("getAllOrderList");
	}

	@Override
	public List<OrderVO> getAllOrderListByOrderStatus(int order_status) {
		return sqlSession.selectList("getAllOrderListByOrderStatus", order_status);
	}

	@Override
	public List<OrderVO> getNotDeliveryUserOrderList(String userid) {
		return sqlSession.selectList("getNotDeliveryUserOrderList", userid);
	}

	@Override
	public int cancelOrder(int order_serial) {
		System.out.println("주문 취소 실행");
		return sqlSession.insert("cancelOrder", order_serial);
	}

	@Override
	public int getTotalSales() {
		return sqlSession.selectOne("getTotalSales");
	}
	
	@Override
	public List<OrderVO> getTotalSalesFromStore() {
		return sqlSession.selectList("getTotalSalesFromStore");
	}

	@Override
	public List<OrderVO> getAllOrderListReceipt() {
		return sqlSession.selectList("getAllOrderListReceipt");
	}

}