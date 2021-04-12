package com.bkc.user.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

public class UserVO {
	@NotEmpty(message="필수 항목입니다.")
	@Size(min=5, max=25, message="길이가 맞지않아요.")
	private String userid;
	
	@NotEmpty(message="필수 항목입니다.")
	@Size(min=4, max=8, message="길이가 맞지않아요.")
	private String password;
	
	@NotEmpty(message="필수 항목입니다.")
	@Size(min=1, max=5, message="길이가 맞지않아요.")
	private String name;
	
	@NotEmpty(message="필수 항목입니다.")
	@Size(min=8, max=13,message="길이가 맞지않아요.")
	private String phone;
	
	private boolean sms_agree;
	private boolean email_agree;
	
	private int enabled; //default 1
	
	private int regist_type;	//간편 로그인 
	
	private int usergrade;	//default 03

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isSms_agree() {
		return sms_agree;
	}

	public void setSms_agree(boolean sms_agree) {
		this.sms_agree = sms_agree;
	}

	public boolean isEmail_agree() {
		return email_agree;
	}

	public void setEmail_agree(boolean email_agree) {
		this.email_agree = email_agree;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public int getRegist_type() {
		return regist_type;
	}

	public void setRegist_type(int regist_type) {
		this.regist_type = regist_type;
	}

	public int getUsergrade() {
		return usergrade;
	}

	public void setUsergrade(int usergrade) {
		this.usergrade = usergrade;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", sms_agree=" + sms_agree + ", email_agree=" + email_agree + ", enabled=" + enabled
				+ ", regist_type=" + regist_type + ", usergrade=" + usergrade + "]";
	}

	
}
