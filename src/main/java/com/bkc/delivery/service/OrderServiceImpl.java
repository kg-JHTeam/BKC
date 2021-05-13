package com.bkc.delivery.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.delivery.dao.OrderDAO;
import com.bkc.delivery.vo.OrderDetailVO;
import com.bkc.delivery.vo.OrderVO;
import com.bkc.menuInform.service.ProductService;
import com.bkc.menuInform.vo.ProductVO;
import com.bkc.user.service.CouponService;
import com.bkc.user.service.UserCouponService;
import com.bkc.user.service.UserService;
import com.bkc.user.vo.CartVO;
import com.bkc.user.vo.UserCouponVO;
import com.bkc.user.vo.UserVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDao;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CouponService couponService;

	@Autowired
	private UserCouponService usercouponService;

	@Autowired
	private ProductService productService;

	@Autowired
	private MyLocationService mylocaService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Override
	@Transactional
	public int insertOrder(OrderVO order) {
		return orderDao.insertOrder(order);
	}

	@Override
	@Transactional
	public OrderVO getOrder(int order_serial) {
		return orderDao.getOrder(order_serial);
	}

	@Override
	@Transactional
	public List<OrderVO> getUserOrderList(String userid) {
		return orderDao.getUserOrderList(userid);
	}

	@Override
	@Transactional
	public void updateProductSerial(OrderVO order) {
		orderDao.updateProductSerial(order);
	}

	@Override
	@Transactional
	public List<OrderVO> getAllOrderList() {
		return orderDao.getAllOrderList();
	}

	@Override
	@Transactional
	public List<OrderVO> getAllOrderListByOrderStatus(int order_status) {
		return orderDao.getAllOrderListByOrderStatus(order_status);
	}

	@Override
	@Transactional
	public List<OrderVO> getNotDeliveryUserOrderList(String userid) {
		return orderDao.getNotDeliveryUserOrderList(userid);
	}

	//주문 신청 트렌잭션 처리 
	@Override
	@Transactional
	public int doOrder(String store_name, String address, String phonenumber, String description, String payment_type,
			int coupon_seq, int total_price, CartVO cart) {

			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = (UserDetails) principal;
			UserVO user = userService.getUserById(userDetails.getUsername());

			// 1. Orderlist 테이블에 추가한다.
			String userid = user.getUserid();
			int order_status = 1; // default 1

			OrderVO order = new OrderVO(phonenumber, store_name, order_status, userid, coupon_seq, payment_type,
					total_price, address);

			// orderlist에 주문 추가
			int order_serial = insertOrder(order); // order_serial

			// 2. Order Detail 테이블에 추가한다. - 메뉴별로 나눠서 <- order_serial 을 받음
			HashMap<Integer, ProductVO> products = cart.getProducts();

			// 2.1 products key가져오기
			Iterator<Integer> iterator = products.keySet().iterator();
			List<Integer> keys = new ArrayList<Integer>();
			while (iterator.hasNext()) {
				keys.add(iterator.next());
			}

			// 2.2 상품갯수만큼 Order Detail에 저장
			int productsCount = products.size();

			for (int i = 0; i < productsCount; i++) {

				ProductVO product = products.get(keys.get(i));
				int product_serial = product.getProduct_serial();
				int quantity = product.getCount();
				int price = product.getPrice() * quantity;

				OrderDetailVO orderDetail = new OrderDetailVO();
				orderDetail.setProduct_serial(product_serial);
				orderDetail.setQuantity(quantity);
				orderDetail.setPrice(price);
				orderDetail.setOrder_serial(order_serial);

				// order list에 첫번째 메뉴에 대해서 대표상품으로 등록
				if (i == 0) {
					order.setProduct_serial(orderDetail.getProduct_serial());
					order.setProductCount(productsCount);
					updateProductSerial(order); // order_serial
				}
				orderDetailService.insertOrderDetail(orderDetail);
			}
			// 카트 세션 삭제 - session.removeAttribute("cart");
			System.out.println(order.toString());
			return order_serial;
		}

	@Override
	@Transactional
	public int cancelOrder(int order_serial) {
		return orderDao.cancelOrder(order_serial);
	}

	@Override
	@Transactional
	public int getTotalSales() {
		return orderDao.getTotalSales();
	}

	@Override
	public List<OrderVO> getTotalSalesFromStore() {
		return orderDao.getTotalSalesFromStore();
	}

	@Override
	public List<OrderVO> getAllOrderListReceipt() {
		return orderDao.getAllOrderListReceipt();
	}


}
