package com.rice.A001.memdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.A001.memvo.A001MemVO;

@Repository
public class A001MemDAOImpl implements A001MemDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<A001MemVO> getList(String id) {
		System.out.println("memdao");
		List<A001MemVO> memList = null;
		memList= sqlsession.selectList("mapper.member.selectMem",id);
		
		
		return memList;
	}

}
