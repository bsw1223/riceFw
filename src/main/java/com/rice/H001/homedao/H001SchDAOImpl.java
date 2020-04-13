package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class H001SchDAOImpl implements H001SchDAO {

	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<Map<String, Object>> selectSchList() {
		
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Sch.selectSchList");
		 
//		 System.out.println("DAO _menuList : " + menuList);
		
		 
		 return menuList;
	}

}
