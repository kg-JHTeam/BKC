//package com.bkc.user.security;
//
//import java.util.Collection;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//
//import com.bkc.user.vo.UserVO;
//
//public class CustomUser extends User {
//
//	private static final long serialVersionUID = 1L;
//	
//	private UserVO user;
//
//	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
//		super(username, password, authorities);
//	}
//	
//	public CustomUser(UserVO user) {
//		super(user.getUserid(), user.getPassword(), user.getAuthorities());
//		this.setUser(user);
//	}
//
//	public UserVO getUser() {
//		return user;
//	}
//
//	public void setUser(UserVO user) {
//		this.user = user;
//	}
//	
//}