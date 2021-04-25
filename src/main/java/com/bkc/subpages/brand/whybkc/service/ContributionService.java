package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import com.bkc.subpages.brand.whybkc.vo.ContributionVO;

public interface ContributionService {
	
	public List<ContributionVO> ContributionList(ContributionVO Contributionvo);
	
	public ContributionVO getContribution(int seq);
	
	public int deleteContribution(int seq);
	
	public int insertContribution(ContributionVO contributionVO);
	
	public int updateContribution(ContributionVO contributionVO);
}
