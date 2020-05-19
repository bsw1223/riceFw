package com.rice.F003.F003service;

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

import com.rice.F003.F003dao.F003CodeDAO;
import com.rice.F003.F003vo.F003CodeVO;
import com.rice.F003.F003vo.F003CodegroupVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class F003CodeServiceImpl implements F003CodeService {
	private static final Logger logger = LoggerFactory.getLogger(F003CodeServiceImpl.class);
	
	@Autowired
	private F003CodeDAO f003CodeDAO;

	// 코드 그룹
	@Override
	public List<F003CodegroupVO> searchgroupList(Map<String, Object> searchMap) throws DataAccessException {
		return f003CodeDAO.searchgroupList(searchMap);
	}
	
	@Override
	public void savegroupData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;	// row 수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				f003CodeDAO.insertgroupData(row);
				System.out.println("------------------------>>" + row.get("key_id"));
			} else if("U".equals(str)) {
				f003CodeDAO.updategroupData(row);
			} else if ("D".equals(str)) {
				f003CodeDAO.deletegroupData(row);
			}
			i++;
		}
	}
	
	// 코드
	@Override
	public List<F003CodeVO> searchcodeList(Map<String, Object> searchMap) throws DataAccessException {
		return f003CodeDAO.searchcodeList(searchMap);
	}
	
	@Override
	public void savecodeData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;	// row 수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				f003CodeDAO.insertcodeData(row);
				System.out.println("------------------------>>" + row.get("key_id"));
			} else if("U".equals(str)) {
				f003CodeDAO.updatecodeData(row);
			} else if ("D".equals(str)) {
				f003CodeDAO.deletecodeData(row);
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
