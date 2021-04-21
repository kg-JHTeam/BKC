package com.bkc.menuInform.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.menuInform.vo.ChickenMenuVO;

@Service
public interface ChickenMenuService {
	
	public List<ChickenMenuVO> getChickenMenu();
}
