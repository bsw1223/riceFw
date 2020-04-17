package com.rice.D002.bookdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class D002BookDAOImpl implements D002BookDAO {
	private static final Logger logger = LoggerFactory.getLogger(D002BookDAOImpl.class);
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<Map<String, Object>> getClassList() {
		return sqlsession.selectList("mapper.book.getClassList");
	}

	@Override
	public List<Map<String, Object>> getBookingList() {
		return sqlsession.selectList("mapper.book.getBookingList");
	}
}
