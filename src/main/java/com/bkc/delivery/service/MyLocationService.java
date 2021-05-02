package com.bkc.delivery.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.delivery.vo.MyLocationVO;

@Service
public interface MyLocationService {
	
	// MY배달지 조회
	public List<MyLocationVO> getLocaList(String userid);
	
	// 최근배달지 조회
	public List<MyLocationVO> newLocaList(String userid);

	// 배달지 등록
	public int insertLoca(MyLocationVO loca);

	//지정 배달지 등록
	public int insertLocaOne(MyLocationVO loca);
	
	//지정 배달지 변경
	public int updateLocaOne(MyLocationVO loca);
	
	//지정 배달지 조회
	public MyLocationVO getLocaOne(String userid); 
	
	// 배달지 개수 조회
	public int getCountLoca(String userid);

	// 배달지 삭제
	public int deleteLoca(int addr_seq);

}