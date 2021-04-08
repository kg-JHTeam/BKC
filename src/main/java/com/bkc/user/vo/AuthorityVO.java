package com.bkc.user.vo;

import javax.validation.constraints.NotEmpty;

public class AuthorityVO {
	@NotEmpty
	private String userid;
	
	@NotEmpty
	private String authority;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String toString() {
		return "AuthorityVO [userid=" + userid + ", authority=" + authority + "]";
	}
}
