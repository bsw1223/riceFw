package com.rice.F002.F002dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.rice.F002.F002vo.F002OpenclassVO;

public interface F002OpenclassDAO {
	// 리스트 불러오기
	public List<F002OpenclassVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	// insert
	public void insertData(Map<String, String> row) throws DataAccessException;
	// update
	public void updateData(Map<String, String> row) throws DataAccessException;
	// delete
	public void deleteData(Map<String, String> row) throws DataAccessException;
}
