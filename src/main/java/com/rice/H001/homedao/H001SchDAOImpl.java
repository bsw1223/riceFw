package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.H001.homevo.H001SchVO;


@Repository
public class H001SchDAOImpl implements H001SchDAO {

	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<Map<String, Object>> selectSchList(String memNum) {
		
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Sch.selectSchList",memNum);
		 
		 System.out.println("DAO _menuList : " + menuList);
		
		 
		 return menuList;
	}

	
	//스케쥴 수정
	@Override
	public void ModifySchInfo(H001SchVO h001SchVO) {

		sqlsession.update("mapper.Sch.modifySchInfo",h001SchVO);
		System.out.println("DAO ModifySchInfo : " + h001SchVO);
		
	}

}
