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

import com.rice.F002.F002dao.F002OpenclassDAO;
import com.rice.F002.F002vo.F002OpenclassVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class F002OpenclassServiceImpl implements F002OpenclassService{
	private static final Logger logger = LoggerFactory.getLogger(F002OpenclassServiceImpl.class);
	
	@Autowired
	private F002OpenclassDAO f002OpenclassDAO;

	// 리스트 불러오기
	@Override
	public List<F002OpenclassVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		return f002OpenclassDAO.searchList(searchMap);
	}

	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;	// row 수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				f002OpenclassDAO.insertData(row);
				System.out.println("------------------------>>" + row.get("key_id"));
			} else if("U".equals(str)) {
				f002OpenclassDAO.updateData(row);
			} else if ("D".equals(str)) {
				f002OpenclassDAO.deleteData(row);
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
