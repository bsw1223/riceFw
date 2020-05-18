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
		List<Map<String, Object>> menuList = new ArrayList<Map<String,Object>>();
		menuList= h001HomeDAO.menuGetList(authId);
		
		return menuList;
	}
	
	@Override
	public List<Map<String, Object>> getMenuListEN(String authId) {
		List<Map<String, Object>> menuList = new ArrayList<Map<String,Object>>();
		menuList= h001HomeDAO.menuGetListEN(authId);
		
		return menuList;
	}
	
	@Override
	public List<Map<String, Object>> getMenuListCN(String authId) {
		List<Map<String, Object>> menuList = new ArrayList<Map<String,Object>>();
		menuList= h001HomeDAO.menuGetListCN(authId);
		
		return menuList;
	}
	
	@Override
	public List<Map<String, Object>> getMenuListJP(String authId) {
		List<Map<String, Object>> menuList = new ArrayList<Map<String,Object>>();
		menuList= h001HomeDAO.menuGetListJP(authId);
		
		return menuList;
	}
	
	@Override
	public List<Map<String, Object>> getMenuListES(String authId) {
		List<Map<String, Object>> menuList = new ArrayList<Map<String,Object>>();
		menuList= h001HomeDAO.menuGetListES(authId);
		
		return menuList;
	}
	

	@Override
	public List<Map<String, Object>> selectSubjectList(String memnum) {
		List subJectInfo=null;
		subJectInfo = h001HomeDAO.getSubList(memnum);
		return subJectInfo;
	}

	@Override
	public Map<String, Object> selectSysdate() {
		Map<String, Object> selectSysdate = h001HomeDAO.selectSysdate();
		//System.out.println("selectSysdate_service : "+selectSysdate);
		return selectSysdate;
	}

	@Override
	public List<Map<String, Object>> dateClassChoice(H001HomeVO h001HomeVO) {
		List<Map<String, Object>> dateClassChoice = h001HomeDAO.dateClassChoice();
		return dateClassChoice;
	}

	@Override
	public Map<String, Object> selectDateToday() {
		Map<String, Object> selectDateToday = h001HomeDAO.selectDateToday();
		return selectDateToday;
	}

	@Override
	public void updateToeicShedule(H001HomeVO h001HomeVO) {
		//System.out.println("service : "+h001HomeVO.toString());
		h001HomeDAO.updateToeicShedule(h001HomeVO);
		
	}

	@Override
	public String selectToeicDate() {
		String selectToeicDate = h001HomeDAO.selectToeicDate();
		return selectToeicDate;
	}

	@Override
	public List<Map<String, Object>> selectDdayList() {
		List<Map<String, Object>> selectDdayList = h001HomeDAO.selectDdayList();
		return selectDdayList;
	}

	@Override
	public String selectToeicDateS() {
		String selectToeicDateS = h001HomeDAO.selectToeicDateS();
		return selectToeicDateS;
	}

	@Override
	public void updateToeicSheduleS(H001HomeVO h001HomeVO) {
		//System.out.println("service : "+h001HomeVO.toString());
		h001HomeDAO.updateToeicSheduleS(h001HomeVO);
	}

	@Override
	public List<Map<String, Object>> selectDdayListS() {
		List<Map<String, Object>> selectDdayListS = h001HomeDAO.selectDdayListS();
		return selectDdayListS;
	}

	// 오늘 수업 목록 get
	@Override
	public List<Map<String, Object>> getTodayClass(Map info) {
		return h001HomeDAO.getTodayClass(info);
	}	
}
