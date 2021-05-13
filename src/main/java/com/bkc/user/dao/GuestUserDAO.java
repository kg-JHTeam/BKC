package com.bkc.user.dao;

import org.springframework.stereotype.Repository;

import com.bkc.user.vo.GuestVO;

@Repository
public interface GuestUserDAO {

	public int insert(GuestVO guest);

}
