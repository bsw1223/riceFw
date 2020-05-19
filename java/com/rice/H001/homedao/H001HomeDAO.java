package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;

public interface H001HomeDAO {
	public Map<String, Object> selectSysdate();

	public List<Map<String, Object>> menuGetList(String authId);
	
	public List<Map<String, Object>> menuGetListEN(String authId);
	
	public List<Map<String, Object>> menuGetListCN(String authId);
	
	public List<Map<String, Object>> menuGetListJP(String authId);
	
	public List<Map<String, Object>> menuGetListES(String authId);
	
	public List<Map<String, Object>> getSubList(String memnum);

	public List<Map<String, Object>> dateClassChoice();

	public Map<String, Object> selectDateToday();

	public void updateToeicShedule(H001HomeVO h001HomeVO);

	public String selectToeicDate();

	public List<Map<String, Object>> selectDdayList();

	public String selectToeicDateS();

	public void updateToeicSheduleS(H001HomeVO h001HomeVO);

	public List<Map<String, Object>> selectDdayListS();

	// 오늘 수업 목록 get
	public List<Map<String, Object>> getTodayClass(Map info);
}
