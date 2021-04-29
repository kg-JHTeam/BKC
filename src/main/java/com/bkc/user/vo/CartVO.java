package com.bkc.user.vo;

import java.util.ArrayList;
import java.util.List;

import com.bkc.menuInform.vo.ProductVO;

//딜리버리 카트 -> DB에서 가 아닌 세션에서 전달된다. 
//왔다갔따해도 사라지지 않게 세션에 넣어둠. 
public class CartVO {
	private List<ProductVO> products = new ArrayList<ProductVO>();
	private int productCount;
	private int totalcost;
	
	public void add(ProductVO vo) {
		products.add(vo);
	}
	public void delete(ProductVO vo) {
		products.remove(vo);
	}
	
	public List<ProductVO> getProducts() {
		return products;
	}
	public void setProducts(List<ProductVO> products) {
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
}
