package com.bkc.user.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class GuestVO {
	@NotEmpty(message = "필수정보입니다.")
	@Email(message = "이메일 형식만 가능합니다.")
	private String email; //이게 아이디로 둘어감. 

	@NotEmpty(message = "필수정보입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String password;

	@NotEmpty(message = "필수정보입니다.")
	@Size(min = 2, max = 10, message = "길이가 맞지 않아요.")
	private String username;
	
	private int seq;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "GuestVO [email=" + email + ", password=" + password + ", username=" + username + ", seq=" + seq + "]";
	}



	
}
