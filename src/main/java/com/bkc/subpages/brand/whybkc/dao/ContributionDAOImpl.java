package com.bkc.subpages.brand.whybkc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bkc.subpages.brand.whybkc.vo.ContributionVO;

@Repository
public class ContributionDAOImpl implements ContributionDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ContributionVO> ContributionList(ContributionVO Contributionvo){
		return sqlSession.selectList("ContributionList", Contributionvo);
	}
}
