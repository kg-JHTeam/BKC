package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bkc.subpages.brand.whybkc.dao.ContributionDAO;
import com.bkc.subpages.brand.whybkc.vo.ContributionVO;

@Service
public class ContributionServiceImpl implements ContributionService{
	
	@Autowired
	private ContributionDAO dao;
	
	@Override
	@Transactional
	public List<ContributionVO> ContributionList(ContributionVO Contributionvo){
		return dao.ContributionList(Contributionvo);
	}
	
	@Override
	@Transactional
	public ContributionVO getContribution(int seq) {
		return dao.getContribution(seq);
	}
	
	@Override
	@Transactional
	public int deleteContribution(int seq) {
		return dao.deleteContribution(seq);
	}
	
	@Override
	public int insertContribution(ContributionVO contributionVO) {
		return dao.insertContribution(contributionVO);
	}
	
	public int updateContribution(ContributionVO contributionVO) {
		return dao.updateContribution(contributionVO);
	}
}
