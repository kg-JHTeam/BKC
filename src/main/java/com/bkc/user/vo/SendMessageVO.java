package com.bkc.user.vo;

import java.util.Date;

public class SendMessageVO {
	private String phoneNumber;

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "SendMessageVO [phoneNumber=" + phoneNumber + "]";
	}
	
	
}
