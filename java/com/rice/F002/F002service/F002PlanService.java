package com.rice.F002.F002service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.rice.F002.F002vo.F002PlanVO;

public interface F002PlanService {
	// 리스트 불러오기
	public List<F002PlanVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
		
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;
}
