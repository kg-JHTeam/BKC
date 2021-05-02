package com.bkc.pay.kakao.vo;

import java.util.Date;

public class KakaoPayApprovalVO {

	private String aid;// 요청 고유 번호
	private String tid;// 결제 고유번호
	private String cid;// 가맹점 코드
	private String partner_order_id;// 가맹점 주문번호, 최대 100자
	private String partner_user_id;// 가맹점 회원 id, 최대 100자
	private String payment_method_type;// 결제 수단, CARD 또는 MONEY 중 하나
	private AmountVO amount;// 결제 금액 정보
	private CardVO card_info;// 결제 상세 정보, 결제수단이 카드일 경우만 포함
	private String item_name;// 상품 이름, 최대 100자
	private String item_code;// 상품 코드, 최대 100자
	private String payload;// 결제 승인 요청에 대해 저장한 값, 요청 시 전달된 내용
	private int quantity;// 상품 수량
	private int tax_free_amount;// 상품 비과세 금액
	private int vat_amount;// 상품 부가세 금액 값을 보내지 않을 경우 다음과 같이 VAT 자동 계산 (상품총액 - 상품 비과세 금액)/11 : 소숫점 이하 반올림
	private Date create_at;// 결제 준비 요청 시간
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

	public CardVO getCard_info() {
		return card_info;
	}

	public void setCard_info(CardVO card_info) {
		this.card_info = card_info;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getPayload() {
		return payload;
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTax_free_amount() {
		return tax_free_amount;
	}

	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}

	public int getVat_amount() {
		return vat_amount;
	}

	public void setVat_amount(int vat_amount) {
		this.vat_amount = vat_amount;
	}

	/**
	 * public Date getCreate_at() { return create_at; }
	 * 
	 * public void setCreate_at(Date create_at) { this.create_at = create_at; }
	 **/

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	@Override
	public String toString() {
		return "KakaoPayApprovalVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", partner_order_id="
				+ partner_order_id + ", partner_user_id=" + partner_user_id + ", payment_method_type="
				+ payment_method_type + ", amount=" + amount + ", card_info=" + card_info + ", item_name=" + item_name
				+ ", item_code=" + item_code + ", payload=" + payload + ", quantity=" + quantity + ", tax_free_amount="
				+ tax_free_amount + ", vat_amount=" + vat_amount + ", create_at=" + create_at + ", approved_at="
				+ approved_at + "]";
	}




}
