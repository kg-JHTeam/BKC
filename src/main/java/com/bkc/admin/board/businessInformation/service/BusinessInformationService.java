package com.bkc.admin.board.businessInformation.service;

import org.springframework.stereotype.Service;

import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;

@Service
public interface BusinessInformationService {

	// BusinessInformation 출력 
	public BusinessInformationVO getBusinessInformation(int seq);

	// BusinessInformation 수정
	public int updateBusinessInformation(BusinessInformationVO vo);

}
