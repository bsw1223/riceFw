package com.rice.F001.F001dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.rice.F001.F001vo.F001VO;

public interface F001DAO {
	// 리스트 불러오기
	public List<F001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	// insert
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void insertData2(Map<String, String> row) throws DataAccessException;
	
	// update
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void updateData2(Map<String, String> row) throws DataAccessException;
	// delete
	public void deleteData(Map<String, String> row) throws DataAccessException;
	public void deleteData2(Map<String, String> row) throws DataAccessException;
}
