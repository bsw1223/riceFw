package com.rice.A001.memdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.A001.memcontroller.A001MemController;
import com.rice.A001.memvo.A001MemVO;

@Repository
public class A001MemDAOImpl implements A001MemDAO {
	private static final Logger logger = LoggerFactory.getLogger(A001MemDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<A001MemVO> getList(String id) {
		List<A001MemVO> memList = null;
		memList= sqlsession.selectList("mapper.member.selectMem",id);
		
		return memList;
	}

	@Override
	public void signup(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.signup", vo);
	}

	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.login", vo);
	}

	@Override
	public int idCheck(String memId) throws Exception {
		int result = sqlsession.selectOne("mapper.member.idCheck", memId);
		
		return result;
	}
}
