package com.rice.F004.F004dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class F004StatisDAOImpl implements F004StatisDAO {
	private static final Logger logger = LoggerFactory.getLogger(F004StatisDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<Map<String, Object>> getTchSalesList(Map info) {
		return sqlsession.selectList("mapper.f004statis.getTchSales", info);
	}

	@Override
	public List<Map<String, Object>> getmonthSales(Map info) {
		return sqlsession.selectList("mapper.f004statis.getmonthSales", info);
	}
}
