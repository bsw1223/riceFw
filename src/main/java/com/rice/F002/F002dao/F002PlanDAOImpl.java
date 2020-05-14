package com.rice.F002.F002dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.rice.F002.F002vo.F002PlanVO;

@Repository
public class F002PlanDAOImpl implements F002PlanDAO {
	private static final Logger logger = LoggerFactory.getLogger(F002PlanDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;

	// 리스트 불러오기
	@Override
	public List<F002PlanVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		return sqlsession.selectList("mapper.f002plan.searchList", searchMap);
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f002plan.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f002plan.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f002plan.deleteData", row);
	}
	
}
