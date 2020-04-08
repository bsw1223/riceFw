package com.rice.H001.homedao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.H001.homevo.H001HomeVO;

@Repository
public class H001HomeDAOImpl implements H001HomeDAO {

	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<Map<String, Object>> menuGetList(String authId) {
		
		 String stringMap = null;
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Home.getMenuList",authId);
				return menuList;
	}

	@Override
	public List<Map<String, Object>> getSubList(String memnum) {
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Home.getSubList",memnum);
		System.out.println("dao");
		
		return list;
	}
}
