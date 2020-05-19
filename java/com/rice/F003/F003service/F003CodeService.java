package com.rice.F003.F003service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.rice.F003.F003vo.F003CodeVO;
import com.rice.F003.F003vo.F003CodegroupVO;

public interface F003CodeService {
	// 코드그룹 리스트 불러오기
	public List<F003CodegroupVO> searchgroupList(Map<String, Object> searchMap) throws DataAccessException;
		
	public void savegroupData(Map<String, String[]> dataMap) throws DataAccessException;
	
	// 코드 리스트 불러오기
	public List<F003CodeVO> searchcodeList(Map<String, Object> searchMap) throws DataAccessException;
		
	public void savecodeData(Map<String, String[]> dataMap) throws DataAccessException;
}
