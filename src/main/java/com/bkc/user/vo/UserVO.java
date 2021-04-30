package com.bkc.user.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserVO implements UserDetails{
	private static final long serialVersionUID = 1L;

	@NotEmpty(message = "필수정보입니다.")
	@Email(message = "이메일 형식만 가능합니다.")
	private String userid;

	@NotEmpty(message = "필수정보입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String password;

	@NotEmpty(message = "필수정보입니다.")
	@Size(min = 2, max = 10, message = "길이가 맞지 않아요.")
	private String name;

	@NotEmpty(message = "필수정보입니다.")
	@Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$", message = "휴대폰번호가 올바르지 않습니다.")
	private String phone;

	private boolean sms_agree;
	private boolean email_agree;
	private boolean agree_rule1;
	private boolean agree_rule2;

	private boolean enabled; // default 1
	private int regist_type; // 간편 로그인
	private int usergrade; // default 03
	private String platFormType;
	
	//security
	private Collection<? extends GrantedAuthority> authorities;
	
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();   
        //기본적으로 ROLE_USER
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return authorities;
	}

	@Override
	public String getUsername() {
		return userid;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}
	
	public boolean isAgree_rule1() {
		return agree_rule1;
	}

	public void setAgree_rule1(boolean agree_rule1) {
		this.agree_rule1 = agree_rule1;
	}

	public boolean isAgree_rule2() {
		return agree_rule2;
	}

	public void setAgree_rule2(boolean agree_rule2) {
		this.agree_rule2 = agree_rule2;
	}

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

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
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

	public String getPlatFormType() {
		return platFormType;
	}

	public void setPlatFormType(String platFormType) {
		this.platFormType = platFormType;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", sms_agree=" + sms_agree + ", email_agree=" + email_agree + ", agree_rule1=" + agree_rule1
				+ ", agree_rule2=" + agree_rule2 + ", enabled=" + enabled + ", regist_type=" + regist_type
				+ ", usergrade=" + usergrade ;
	}
}
