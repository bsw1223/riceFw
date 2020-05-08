package com.rice.H001.homeservice;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;

public interface H001HomeService {

	public List<Map<String, Object>> getMenuList(String authId);
	
	public List<Map<String, Object>> selectSubjectList(String memnum);

	public Map<String, Object> selectSysdate();

	public List<Map<String, Object>> dateClassChoice(H001HomeVO h001HomeVO);

	public Map<String, Object> selectDateToday();

	public void updateToeicShedule(H001HomeVO h001HomeVO);

	public String selectToeicDate();

	public List<Map<String, Object>> selectDdayList();
}
