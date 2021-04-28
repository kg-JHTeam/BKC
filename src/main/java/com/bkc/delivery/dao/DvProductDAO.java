package com.bkc.delivery.dao;

import java.util.List;

import com.bkc.delivery.vo.DvProductVO;

public interface DvProductDAO {

	public List<DvProductVO> getChickenMenudv();

	public List<DvProductVO> getSideMenudv();

	public List<DvProductVO> getBeerZonedv();

	public List<DvProductVO> getNewdv();

}
