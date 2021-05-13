package com.bkc.user.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.bkc.user.service.UserService;
import com.bkc.user.vo.UserVO;

@Component
public class LoginUtil {
	
	@Autowired
	private UserService service;

	public void loginWithoutForm(String email) {
		UserVO user = service.getUserById(email);
		int role = user.getUsergrade();
		String roles = "ROLE_USER";
		switch(role) {
			case 1 : roles = "ROLE_USER"; break;
			case 2 : roles = "ROLE_MANAGER"; break;
			case 3 : roles = "ROLE_ADMIN"; break;
			default : roles = "ROLE_USER";
		}
		
		Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
	}
	
	public boolean socialLoginProc(String email, String name, String type, UserVO user) {
		boolean flag = false;
		System.out.println("들어온정보 : " + email + " " + name + " " + type  +"  ");
		
		//카카오톡 이메일로, 회원가입이 안된 경우 
		if (user == null) {
			user = new UserVO();
			user.setUserid(email);
			user.setName(name);
			user.setPlatFormType(type);
			service.socialInsert(user);
			return flag;
		} 
		
		//카카오톡 이메일로 회원가입이 되어있는 경우  
		else if(email.equals(user.getUserid())) { 
			service.updatePlatForm(email, type);
			return flag;
		} 
		
		else if(email.equals(user.getUserid())  && user.getPlatFormType().equals("")){
			System.out.println("duplicate email");
			flag = true;
			return flag;
		}
		return flag;
	}
}
