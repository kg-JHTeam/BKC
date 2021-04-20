package com.bkc.menuInform.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.SideMenuVO;

@Repository
public interface SideMenuDAO {
	//메뉴
	public List<SideMenuVO>getSidemenuList();
	
	//메뉴상세
	public SideMenuVO getSidemenu(String product_serial);
}
