package com.bkc.businessInformation.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.banner.dao.BannerDAO;
import com.bkc.admin.board.banner.vo.BannerVO;
import com.bkc.businessInformation.dao.BusinessInformationDAO;
import com.bkc.businessInformation.vo.BusinessInformationVO;

@Service
public class BusinessInformationServiceImpl implements BusinessInformationService {

	@Autowired
	private BusinessInformationDAO biDao;
	
	@Override
	public BusinessInformationVO getBusinessInformation(int seq) {
		return biDao.getBusinessInformation(seq);
	}

	@Override
	public int updateBusinessInformation(BusinessInformationVO vo) {
		return biDao.updateBusinessInformation(vo);
	}

}
