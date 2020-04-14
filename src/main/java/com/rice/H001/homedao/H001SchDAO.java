package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;

public interface H001SchDAO {
	public List<Map<String, Object>> selectSchList(String memNum);
	
}
