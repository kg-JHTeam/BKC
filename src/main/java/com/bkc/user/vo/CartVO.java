package com.bkc.user.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.bkc.menuInform.vo.ProductVO;

//딜리버리 카트 -> DB에서 가 아닌 세션에서 전달된다. 
//왔다갔따해도 사라지지 않게 세션에 넣어둠. 
public class CartVO {
	// product serial 로 들어감. 
	// Product_serial, Product
	private HashMap<Integer, ProductVO> products = new HashMap<Integer, ProductVO>();// HashMap생성

	// 상품의 총갯수
	private int productCount = 0; //기본값이 0 
	
	// 카트에 있는 모든 상품의 총합계
	private int totalcost;

	//가장 처음 주문한 상품의 이름
	private String productMainTitle;
	
	//ProductVO Key
	private List<Integer> keyset;
	
	public List<Integer> getKeyset() {
		return keyset;
	}
	
	public void setKeyset(List<Integer> keyset) {
		this.keyset = keyset;
	}
	
	public String getProductMainTitle() {
		return productMainTitle;
	}
	public void setProductMainTitle(String productMainTitle) {
		this.productMainTitle = productMainTitle;
	}
	public HashMap<Integer, ProductVO> getProducts() {
		return products;
	}
	public void setProducts(HashMap<Integer, ProductVO> products) {
		this.products = products;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getTotalcost() {
		return totalcost;
	}
	public void setTotalcost(int totalcost) {
		this.totalcost = totalcost;
	}
	
	public void minusProductCount() {
		this.productCount--;
	}
	
	// 처음에 값하나 추가.
	public void addFirst(int product_serial, ProductVO product) {
		product.setCount(1);
		productCount = 1;
		products.put(product_serial, product); // 값 추가
		setProductMainTitle(product.getProduct_name());
	}

	// 처음이 아닌 경우 값 하나 추가.
	public void addProduct(int product_serial, ProductVO product) {
		product.plusOne();
		productCount++;
		// Hashmap에 들어감.
		products.put(product_serial, product); // 값 추가
	}

	// 카트 전체 삭제 기능. 
	// products 자체를 비우기 
	public void deleteAll() {
		products.clear();
	}

	// 상품 하나 삭제하는 경우
	// 상품 완전히 삭제
	public void delete(int product_serial) {
		// 상품 자체를 삭제.
		products.remove(product_serial);
	}

	//product 자체에 갯수 매개변수가 있다. 
	// 상품 + || - 버튼 관련
	// 상품 하나 + 시킴
	public void plusOne(int product_serial) {
		// serial을 받아와서 product를 빼온다.
		ProductVO product = products.get(product_serial);

		// 갯수 하나 증가시킴.
		product.plusOne();
	}

	// 상품 하나 - 시킴
	public void minusOne(int product_serial) {
		// serial을 받아와서 product를 빼온다.s
		ProductVO product = products.get(product_serial);

		// 갯수 하나 증가시킴.
		product.minusOne();
	}

}
