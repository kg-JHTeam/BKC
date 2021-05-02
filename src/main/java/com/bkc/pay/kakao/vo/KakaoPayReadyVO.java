package com.bkc.pay.kakao.vo;

import java.util.Date;


public class KakaoPayReadyVO {

	// response
	private String tid;//결제 고유 번호
	private String next_redirect_pc_url;//카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력 화면
	private Date created_at;//카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력 화면
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	@Override
	public String toString() {
		return "KakaoPayReadyVO [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
				+ created_at + "]";
	}

	
}
