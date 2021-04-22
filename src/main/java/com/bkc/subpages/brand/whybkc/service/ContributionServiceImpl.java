package com.bkc.subpages.brand.whybkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.subpages.brand.whybkc.dao.ContributionDAO;
import com.bkc.subpages.brand.whybkc.vo.ContributionVO;

@Service
public class ContributionServiceImpl implements ContributionService{
	
	@Autowired
	private ContributionDAO dao;
	
	@Override
	public List<ContributionVO> ContributionList(ContributionVO Contributionvo){
		return dao.ContributionList(Contributionvo);
	}
}
