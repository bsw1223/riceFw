package com.rice.F003.F003dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.rice.F003.F003vo.F003CodeVO;
import com.rice.F003.F003vo.F003CodegroupVO;

@Repository
public class F003CodeDAOImpl implements F003CodeDAO {
	private static final Logger logger = LoggerFactory.getLogger(F003CodeDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;

	//// 코드그룹
	@Override
	public List<F003CodegroupVO> searchgroupList(Map<String, Object> searchMap) throws DataAccessException {
		return sqlsession.selectList("mapper.f003code.searchgroupList", searchMap);
	}

	@Override
	public void insertgroupData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f003code.insertgroupData", row);
	}

	@Override
	public void updategroupData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f003code.updategroupData", row);
	}

	@Override
	public void deletegroupData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f003code.deletegroupData", row);
	}

	//// 코드
	@Override
	public List<F003CodeVO> searchcodeList(Map<String, Object> searchMap) throws DataAccessException {
		return sqlsession.selectList("mapper.f003code.searchcodeList", searchMap);
	}

	@Override
	public void insertcodeData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f003code.insertcodeData", row);
	}

	@Override
	public void updatecodeData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f003code.updatecodeData", row);
	}

	@Override
	public void deletecodeData(Map<String, String> row) throws DataAccessException {
		sqlsession.update("mapper.f003code.deletecodeData", row);
	}
	
	
}
