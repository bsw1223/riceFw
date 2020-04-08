package com.rice.D001.builddao;

import java.util.List;
import java.util.Map;

import com.rice.D001.buildvo.D001BuildVO;

public interface D001BuildDAO {
	// 건물정보
	public List<Map<String, Object>> getInfo(String bulId);
	
	public List<Map<String, Object>> getInfoClass(String classId);

	public List<Map<String, Object>> getInfoClR();

	public List<Map<String, Object>> getInfoBUL();

	public List<Map<String, Object>> getBulName();
	
	public void insertClR(D001BuildVO d001BuildVO);

	
}
