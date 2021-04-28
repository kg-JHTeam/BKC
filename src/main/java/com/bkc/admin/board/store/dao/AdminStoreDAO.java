package com.bkc.admin.board.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bkc.event.vo.StoreVO;

@Repository
public interface AdminStoreDAO {
	

	// 신규매장 목록 조회
	public List<StoreVO> getAdStoreList(StoreVO store);

	// 신규매장 상세 조회
	public StoreVO getAdStore(int store_serial);

	// 신규매장 등록
	public int insertStore(StoreVO store);

	// 신규매장 수정
	public int updateStore(StoreVO store);

	// 신규매장 이벤트 상태 변경
	public int newStatus(int store_serial);
	
	// 신규매장 삭제
	public int deleteStore(int store_serial);

}
