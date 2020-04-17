package com.rice.D002.bookservice;

import java.util.List;
import java.util.Map;

import com.rice.D002.bookvo.D002BookVO;

public interface D002BookService {
	// get 강의실 목록
	public List<Map<String, Object>> getClassList();
	// get 예약 목록
	public List<Map<String, Object>> getBookingList();
	// get 예약자 번호
	public String getBookingMem(String bookNum);
	// get 한 개의 예약 정보 가져오기
	public Map<String, Object> getBookingInfo(String bookNum);
	// get 한 개 강의실 정보 가져오기
	public Map<String, Object> getClassInfo(String classId);
	
	// 새로운 예약 등록
	public void insertBooking(D002BookVO d002BookVO);
	// 예약 취소 상태 업데이트
	public void deleteBooking(D002BookVO d002BookVO);
	// 예약 정보 수정
	public void updateBooking(D002BookVO d002BookVO);
	
	// 내 예약 현황 가져오기
	public List<Map<String, Object>> getMybookList(Map info);
}
