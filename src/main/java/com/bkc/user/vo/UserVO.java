package com.bkc.user.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


public class UserVO {
	
	@NotEmpty
	@Size(min=5, max=50)
	private String userid;
	
	@NotEmpty
	private String userpw;
	
	@NotEmpty
	@Size(min=1, max=10)
	private String name;
	private boolean sms_agree;
	private boolean email_agree;
	
	@NotEmpty
	private boolean enabled;
	
	@NotEmpty
	@Size(min=1, max=13)
	private String phone;
	
	@NotEmpty
	private int regist_type;	//간편 로그인 
	
	@Size(min=1, max=20)
	private String store_serial;
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getRegist_type() {
		return regist_type;
	}
	public void setRegist_type(int regist_type) {
		this.regist_type = regist_type;
	}
	
	public String getStore_serial() {
		return store_serial;
	}
	public void setStore_serial(String store_serial) {
		this.store_serial = store_serial;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", name=" + name + ", sms_agree=" + sms_agree
				+ ", email_agree=" + email_agree + ", enabled=" + enabled + ", phone=" + phone + ", regist_type="
				+ regist_type + "]";
	}
	
	
	
}