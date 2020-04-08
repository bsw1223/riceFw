package com.rice.H001.homeservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.rice.H001.homedao.H001HomeDAO;
import com.rice.H001.homevo.H001HomeVO;

@Service
public class H001HomeServiceImpl implements H001HomeService{
	
	@Autowired
	private H001HomeDAO h001HomeDAO;
	private H001HomeVO h001HomeVO;
	
	@Override
	public List<Map<String, Object>> getMenuList(String authId) {
		
		System.out.println("service 진행 authId :"+ authId);
		
		List<Map<String, Object>> menuList = new ArrayList<Map<String,Object>>();
		menuList= h001HomeDAO.menuGetList(authId);
		
		
		System.out.println(menuList);
		
		return menuList;
	}

	@Override
	public List<Map<String, Object>> selectSubjectList(String memnum) {
		List subJectInfo=null;
		subJectInfo = h001HomeDAO.getSubList(memnum);
		return subJectInfo;
	}

	
	
}
