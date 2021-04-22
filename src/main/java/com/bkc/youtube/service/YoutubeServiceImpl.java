package com.bkc.youtube.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkc.youtube.dao.YoutubeDAO;
import com.bkc.youtube.vo.YoutubeVO;

@Service
public class YoutubeServiceImpl implements YoutubeService {

	@Autowired
	private YoutubeDAO ytDao;

	@Override
	public List<YoutubeVO> getYoutubeList() {
		return ytDao.getYoutubeList();
	}

	@Override
	public YoutubeVO getYoutubeBySeq(YoutubeVO vo) {
		return ytDao.getYoutubeBySeq(vo);
	}

	@Override
	public int changeStatusYoutube(int img_seq) {
		return ytDao.changeStatusYoutube(img_seq);
	}

	@Override
	public int deleteYoutube(int img_seq) {
		return ytDao.deleteYoutube(img_seq);
	}

	@Override
	public int insertYoutube(YoutubeVO vo) {
		return ytDao.insertYoutube(vo);
	}

	@Override
	public YoutubeVO getYoutube() {
		return ytDao.getYoutube();
	}

	@Override
	public int updateYoutube(YoutubeVO vo) {
		return ytDao.updateYoutube(vo);
	}

}
