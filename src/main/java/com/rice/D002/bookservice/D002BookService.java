package com.rice.D002.bookservice;

import java.util.List;
import java.util.Map;

public interface D002BookService {
	// get 강의실 목록
	public List<Map<String, Object>> getClassList();
	// get 예약 목록
	public List<Map<String, Object>> getBookingList();
}
