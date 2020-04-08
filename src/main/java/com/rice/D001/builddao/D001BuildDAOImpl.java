package com.rice.D001.builddao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.D001.buildvo.D001BuildVO;


@Repository
public class D001BuildDAOImpl implements D001BuildDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<Map<String, Object>> getInfo(String bulId) {

		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getBuildInfo",bulId);
		return list;
		
	}

	//강의실정보
	@Override
	public List<Map<String, Object>> getInfoClass(String classId) {
				
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getClassInfo",classId);
		return list;
	}
	
	
	//강의실등록에서 강의실정보 불러오기
	@Override
	public List<Map<String, Object>> getInfoClR() {
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getClRInfo");
		return list;
	}

	@Override
	public List<Map<String, Object>> getInfoBUL() {
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getBULInfo");
		return list;
	}

	
	//강의실등록에서  건물이름 받아오기 
	@Override
	public List<Map<String, Object>> getBulName() {
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getBuildName");
		return list;
	}
	
	//강의실 등록에서 등록하기
	@Override
	public void insertClR(D001BuildVO d001BuildVO) {
		sqlsession.selectList("mapper.Build.insertClRInfo",d001BuildVO);
		String getBulId = d001BuildVO.getBulId();
			
	}

	


}
