package com.bkc.pay.naver.vo;

import java.util.Date;

import com.bkc.pay.kakao.vo.AmountVO;

public class NaverPayApprovalVO {
	private String aid;// 요청 고유 번호
	private String tid;// 결제 고유번호
	private String cid;// 가맹점 코드
	private String partner_order_id;// 가맹점 주문번호, 최대 100자
	private String partner_user_id;// 가맹점 회원 id, 최대 100자
	private String payment_method_type;// 결제 수단, CARD 또는 MONEY 중 하나
	private AmountVO amount;// 결제 금액 정보
	private String productName;// 상품 이름, 최대 100자
	private int quantity;// 상품 수량
	private int taxExScopeAmount;// 상품 비과세 금액
	private int taxScopeAmount;// 상품 부가세 금액 값을 보내지 않을 경우 다음과 같이 VAT 자동 계산 (상품총액 - 상품 비과세 금액)/11 : 소숫점 이하 반올림
	private Date approved_at;// 결제 승인 시각

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public AmountVO getAmount() {
		return amount;
	}

	public void setAmount(AmountVO amount) {
		this.amount = amount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTaxExScopeAmount() {
		return taxExScopeAmount;
	}

	public void setTaxExScopeAmount(int taxExScopeAmount) {
		this.taxExScopeAmount = taxExScopeAmount;
	}

	public int getTaxScopeAmount() {
		return taxScopeAmount;
	}

	public void setTaxScopeAmount(int taxScopeAmount) {
		this.taxScopeAmount = taxScopeAmount;
	}

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	@Override
	public String toString() {
		return "NaverPayApprovalVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", partner_order_id="
				+ partner_order_id + ", partner_user_id=" + partner_user_id + ", payment_method_type="
				+ payment_method_type + ", amount=" + amount + ", productName=" + productName + ", quantity=" + quantity
				+ ", taxExScopeAmount=" + taxExScopeAmount + ", taxScopeAmount=" + taxScopeAmount + ", approved_at="
				+ approved_at + "]";
	}

}
