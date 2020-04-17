package com.rice.H001.homeservice;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;
import com.rice.H001.homevo.H001SchVO;

public interface H001SchService {

	public List<Map<String, Object>> selectSchList(String memNum);
	
	public void ModifySchInfo(H001SchVO h001SchVO);
	
}
