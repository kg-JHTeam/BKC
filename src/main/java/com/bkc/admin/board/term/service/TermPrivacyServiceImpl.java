package com.bkc.admin.board.term.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.admin.board.term.dao.TermPrivacyDAO;
import com.bkc.admin.board.term.vo.TermPrivacyVO;

@Service
public class TermPrivacyServiceImpl implements TermPrivacyService {
	
	@Autowired
	private TermPrivacyDAO termPrivacyDao;
	
	@Override
	public TermPrivacyVO getTermPrivacyList() {
		return termPrivacyDao.getTermPrivacyList();
	}

	@Override
	public TermPrivacyVO getTermPrivacyList(TermPrivacyVO termPrivacy) {
		return termPrivacyDao.getTermPrivacyList(termPrivacy);
	}

	@Override
	public void updateTermPrivacy(TermPrivacyVO termPrivacy) {
		termPrivacyDao.updateTermPrivacy(termPrivacy);		
	}

}
