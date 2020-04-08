package com.rice.D001.buildservice;

import java.util.List;
import java.util.Map;

import com.rice.D001.builddao.D001BuildDAO;
import com.rice.D001.buildvo.D001BuildVO;


public interface D001BuildService {
	
	public List<Map<String, Object>> selectInfo(String bulId);
	
	public List<Map<String, Object>> selectClassInfo(String calssId);

	public List<Map<String, Object>> selectClRnfo();
	
	public List<Map<String, Object>> selectBulnfo();

	public List<Map<String, Object>> selectBulName();
	
	public void insertClR(D001BuildVO d001BuildVO);
	

}
