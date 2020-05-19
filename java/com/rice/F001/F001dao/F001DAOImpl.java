package com.rice.F001.F001dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.rice.F001.F001vo.F001VO;

@Repository
public class F001DAOImpl implements F001DAO{
	private static final Logger logger = LoggerFactory.getLogger(F001DAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<F001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F001VO> list = sqlsession.selectList("mapper.f001.searchList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f001.insertData", row);
	}
	
	@Override
	public void insertData2(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f001.insertData2", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f001.updateData", row);
	}
	
	@Override
	public void updateData2(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f001.updateData2", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f001.deleteData", row);
	}

	@Override
	public void deleteData2(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f001.deleteData2", row);
	}

}
