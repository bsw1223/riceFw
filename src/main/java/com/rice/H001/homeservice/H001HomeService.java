package com.rice.H001.homeservice;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;

public interface H001HomeService {

	public List<Map<String, Object>> getMenuList(String authId);
	
	public List<Map<String, Object>> selectSubjectList(String memnum);
}
