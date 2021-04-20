package com.bkc.menuInform.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.menuInform.vo.SideMenuVO;

@Service
public interface SideMenuService {

	public List<SideMenuVO> getSidemenuList();

	public SideMenuVO getSidemenu(String product_serial);
}
