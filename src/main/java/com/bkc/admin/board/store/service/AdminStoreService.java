package com.bkc.admin.board.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bkc.event.vo.StoreVO;

@Service
public interface AdminStoreService {

	//신규매장 목록 조회
	public List<StoreVO> getAdStoreList(StoreVO store);
	
	//신규매장 상세 조회
	public StoreVO getAdStore(String store_name);
	
	//신규매장 등록
	public int adinsertStore(StoreVO store);
	
	//신규매장 수정
	public int adupdateStore(StoreVO store);
	
	//신규매장 이벤트 상태 변경
	public int newStatus(String store_name);
	
	// 신규매장 삭제
	public int deleteStore(String store_name);
}
