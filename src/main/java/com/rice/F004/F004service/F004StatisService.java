package com.rice.F004.F004service;

import java.util.List;
import java.util.Map;

public interface F004StatisService {
	// 강사 월 매출 가져오기
	public List<Map<String, Object>> getTchSalesList(Map info);
	
	// 월 매출 가져오기
	public List<Map<String, Object>> getmonthSales(Map info);
}
