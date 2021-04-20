package com.bkc.menuInform.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.menuInform.vo.ChickenMenuVO;

@Repository
public interface ChickenMenuDAO {
	
	//치킨 메뉴 조회
	public List<ChickenMenuVO>getChickenMenu();
}
