package com.bkc.subpages.brand.whybkc.dao;

import java.util.List;

import com.bkc.subpages.brand.whybkc.vo.ContributionVO;

public interface ContributionDAO {
	
	public List<ContributionVO> ContributionList(ContributionVO Contributionvo);
	
	public ContributionVO getContribution(int seq);
	
	public int deleteContribution(int seq);
	
	public int insertContribution(ContributionVO contributionVO);
	
	public int updateContribution(ContributionVO contributionVO);
}
