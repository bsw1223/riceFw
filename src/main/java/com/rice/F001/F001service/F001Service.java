package com.rice.F001.F001service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.rice.F001.F001vo.F001VO;

public interface F001Service {
	public List<F001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;
}
