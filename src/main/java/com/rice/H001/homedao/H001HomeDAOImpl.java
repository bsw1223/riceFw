package com.rice.H001.homedao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.H001.homevo.H001HomeVO;

@Repository
public class H001HomeDAOImpl implements H001HomeDAO {

	@Autowired
	private SqlSession sqlsession;
	private H001HomeVO h001HomeVO;
	
	
	@Override
	public List<Map<String, Object>> menuGetList(String authId) {
		
		 String stringMap = null;
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Home.getMenuList",authId);
				return menuList;
	}
	
	@Override
	public List<Map<String, Object>> menuGetListEN(String authId) {
		
		 String stringMap = null;
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Home.getMenuListEN",authId);
				return menuList;
	}
	
	@Override
	public List<Map<String, Object>> menuGetListCN(String authId) {
		
		 String stringMap = null;
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Home.getMenuListCN",authId);
				return menuList;
	}
	
	@Override
	public List<Map<String, Object>> menuGetListJP(String authId) {
		
		 String stringMap = null;
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Home.getMenuListJP",authId);
				return menuList;
	}
	
	@Override
	public List<Map<String, Object>> menuGetListES(String authId) {
		
		 String stringMap = null;
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Home.getMenuListES",authId);
				return menuList;
	}

	@Override
	public List<Map<String, Object>> getSubList(String memnum) {
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Home.getSubList",memnum);
		
		return list;
	}

	@Override
	public Map<String, Object> selectSysdate() {
		Map<String, Object> selectSysdate= sqlsession.selectOne("mapper.Home.selectSysdate");
		//System.out.println("selectSysdate_dao : "+selectSysdate);
		return selectSysdate;
	}

	@Override
	public List<Map<String, Object>> dateClassChoice() {
		List<Map<String, Object>> dateClassChoice= sqlsession.selectList("mapper.Home.dateClassChoice");
		return dateClassChoice;
	}

	@Override
	public Map<String, Object> selectDateToday() {
		Map<String, Object> selectDateToday= sqlsession.selectOne("mapper.Home.selectDateToday");
		return selectDateToday;
	}

	@Override
	public void updateToeicShedule(H001HomeVO h001HomeVO) {
		//System.out.println("dao : "+h001HomeVO.toString());
		sqlsession.update("mapper.Home.updateToeicShedule",h001HomeVO);
		
	}

	@Override
	public String selectToeicDate() {
		
		String selectToeicDate= sqlsession.selectOne("mapper.Home.selectToeicDate");
		return selectToeicDate;
	}
	@Override
	public String selectToeicDateS() {
		
		String selectToeicDateS= sqlsession.selectOne("mapper.Home.selectToeicDateS");
		return selectToeicDateS;
	}

	@Override
	public List<Map<String, Object>> selectDdayList() {
		List<Map<String, Object>> selectDdayList= sqlsession.selectList("mapper.Home.selectDdayList");
		return selectDdayList;
	}

	@Override
	public void updateToeicSheduleS(H001HomeVO h001HomeVO) {
		//System.out.println("dao : "+h001HomeVO.toString());
				sqlsession.update("mapper.Home.updateToeicSheduleS",h001HomeVO);
		
	}

	@Override
	public List<Map<String, Object>> selectDdayListS() {
		List<Map<String, Object>> selectDdayListS= sqlsession.selectList("mapper.Home.selectDdayListS");
		return selectDdayListS;
	}
	
	// 오늘 수업 목록 get
	@Override
	public List<Map<String, Object>> getTodayClass(Map info) {
		return sqlsession.selectList("mapper.Home.getTodayClass", info);
	}
}
