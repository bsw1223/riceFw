package com.rice.F002.F002service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.F002.F002dao.F002SubjectDAO;
import com.rice.F002.F002vo.F002SubjectVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class F002SubjectServiceImpl implements F002SubjectService {
	private static final Logger logger = LoggerFactory.getLogger(F002SubjectServiceImpl.class);
	
	@Autowired
	private F002SubjectDAO f002SubjectDAO;

	// 리스트 불러오기
	@Override
	public List<F002SubjectVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		return f002SubjectDAO.searchList(searchMap);
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;	// row 수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				f002SubjectDAO.insertData(row);
				System.out.println("------------------------>>" + row.get("key_id"));
			} else if("U".equals(str)) {
				f002SubjectDAO.updateData(row);
			} else if ("D".equals(str)) {
				f002SubjectDAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name: dataMap.keySet()) {
			String[] data = dataMap.get((name));
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}
		return row;
	}
}
