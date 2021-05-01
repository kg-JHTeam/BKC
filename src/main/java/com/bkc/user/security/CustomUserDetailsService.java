//package com.bkc.user.security;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import com.bkc.user.dao.UserDAO;
//import com.bkc.user.vo.UserVO;
//
//public class CustomUserDetailsService implements UserDetailsService {
//
//	@Autowired
//	private UserDAO dao;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		UserVO user = dao.getUserById(username);
//		if( user == null) {
//			throw new UsernameNotFoundException("username " + username + " not found");
//		}
//		
//		if( user.getPassword() == null) {
//			 user.setPassword("");
//		}
//		return user == null ? null : new CustomUser(user);
//	}
//}
