package com.bkc.admin.board.businessInformation.vo;

public class BusinessInformationVO {
	private int seq;
	private String address;
	private String tel;
	private String business_num;
	private String ceo_name;
	private String copyright;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(String business_num) {
		this.business_num = business_num;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	@Override
	public String toString() {
		return "BusinessInformationVO [seq=" + seq + ", address=" + address + ", tel=" + tel + ", business_num="
				+ business_num + ", ceo_name=" + ceo_name + ", copyright=" + copyright + "]";
	}
	
	
}
