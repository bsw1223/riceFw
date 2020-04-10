package com.rice.F001.F001service;

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

import com.rice.F001.F001dao.F001DAO;
import com.rice.F001.F001vo.F001VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class F001ServiceImpl implements F001Service {
	private static final Logger logger = LoggerFactory.getLogger(F001ServiceImpl.class);

	@Autowired
	private F001DAO f001DAO;
	
	@Override
	public List<F001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F001VO> list = f001DAO.searchList(searchMap);
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;	// row 수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				f001DAO.insertData(row);
				f001DAO.insertData2(row);
				System.out.println("------------------------>>" + row.get("key_id"));
			} else if("U".equals(str)) {
				f001DAO.updateData(row);
				f001DAO.updateData2(row);
			} else if ("D".equals(str)) {
				f001DAO.deleteData(row);
				f001DAO.deleteData2(row);
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
