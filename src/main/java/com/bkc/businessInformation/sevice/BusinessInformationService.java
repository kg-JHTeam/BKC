package com.bkc.businessInformation.sevice;

import org.springframework.stereotype.Service;

import com.bkc.businessInformation.vo.BusinessInformationVO;

@Service
public interface BusinessInformationService {

	// BusinessInformation 출력 
	public BusinessInformationVO getBusinessInformation(int seq);

	// BusinessInformation 수정
	public int updateBusinessInformation(BusinessInformationVO vo);

}
