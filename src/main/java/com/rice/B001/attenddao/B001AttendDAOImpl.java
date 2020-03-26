package com.rice.B001.attenddao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class B001AttendDAOImpl implements B001AttendDAO {

	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public List<B001AttendDAO> getList() {
		List b001AttendDAO = null;
		b001AttendDAO = sqlSession.selectList("mapper.attend.listAttend");
		
		return b001AttendDAO;
	}

}
