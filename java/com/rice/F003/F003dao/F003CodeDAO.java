package com.rice.F003.F003dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.rice.F003.F003vo.F003CodeVO;
import com.rice.F003.F003vo.F003CodegroupVO;

public interface F003CodeDAO {
	// 코드그룹 리스트 불러오기
	public List<F003CodegroupVO> searchgroupList(Map<String, Object> searchMap) throws DataAccessException;
	
	// insert
	public void insertgroupData(Map<String, String> row) throws DataAccessException;
	// update
	public void updategroupData(Map<String, String> row) throws DataAccessException;
	// delete
	public void deletegroupData(Map<String, String> row) throws DataAccessException;

	// 코드 리스트 불러오기
	public List<F003CodeVO> searchcodeList(Map<String, Object> searchMap) throws DataAccessException;
		
	// insert
	public void insertcodeData(Map<String, String> row) throws DataAccessException;
	// update
	public void updatecodeData(Map<String, String> row) throws DataAccessException;
	// delete
	public void deletecodeData(Map<String, String> row) throws DataAccessException;
}
