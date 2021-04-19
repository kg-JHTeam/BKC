package com.bkc.businessInformation.dao;

import com.bkc.businessInformation.vo.BusinessInformationVO;

public interface BusinessInformationDAO {

	public BusinessInformationVO getBusinessInformation(int seq);

	public int updateBusinessInformation(BusinessInformationVO vo);

}
