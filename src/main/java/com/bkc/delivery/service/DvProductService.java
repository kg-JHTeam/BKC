package com.bkc.delivery.service;

import java.util.List;

import com.bkc.delivery.vo.DvProductVO;

public interface DvProductService {

	public List<DvProductVO> getChickenMenudv();

	public List<DvProductVO> getSideMenudv();

	public List<DvProductVO> getBeerZonedv();

	public List<DvProductVO> getNewdv();



}
