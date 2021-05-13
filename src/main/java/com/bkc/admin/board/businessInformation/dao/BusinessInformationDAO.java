package com.bkc.admin.board.businessInformation.dao;

import com.bkc.admin.board.businessInformation.vo.BusinessInformationVO;

public interface BusinessInformationDAO {

	public BusinessInformationVO getBusinessInformation(int seq);

	public int updateBusinessInformation(BusinessInformationVO vo);

}
