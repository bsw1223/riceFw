package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;

public interface H001HomeDAO {
	public List<Map<String, Object>> menuGetList(String authId);
	
	public List<Map<String, Object>> getSubList(String memnum);
}
