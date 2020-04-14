package com.rice.D002.bookdao;

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
}
