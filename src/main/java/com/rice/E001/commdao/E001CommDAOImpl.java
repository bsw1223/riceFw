package com.rice.E001.commdao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.E001.commvo.E001CommVO;

@Repository
public class E001CommDAOImpl implements E001CommDAO {

	@Autowired
	private SqlSession sqlsession;


	@Override
	public void insertSelectKey(E001CommVO vo) {

		sqlsession.insert("mapper.comm.insertSelectKey", vo);
	}

	@Override
	public int urlCheck(String commURL) throws Exception {
		return sqlsession.selectOne("mapper.comm.urlCheck", commURL);
	}	
	
	@Override
	public int nameCheck(String commName) throws Exception {
		return sqlsession.selectOne("mapper.comm.nameCheck", commName);
	}	


}
