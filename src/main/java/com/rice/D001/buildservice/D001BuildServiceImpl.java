package com.rice.D001.buildservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.D001.builddao.D001BuildDAO;
import com.rice.D001.buildvo.D001BuildVO;

@Service
public class D001BuildServiceImpl implements D001BuildService {

	@Autowired
	private D001BuildDAO d001BuildDAO;
	

	@Override
	public List<Map<String, Object>> selectInfo(String bulId) {
		List buildInfo=null;
		buildInfo = d001BuildDAO.getInfo(bulId);
		return buildInfo;
	}
	
	@Override
	public List<Map<String, Object>> selectClassInfo(String classId) {
		List classInfo=null;
		classInfo = d001BuildDAO.getInfoClass(classId);
		return classInfo;
	}

	
	//강의실 등록에서 강의실 종류받아오기
	@Override
	public List<Map<String, Object>> selectClRnfo() {
		List clRInfo=null;
		clRInfo = d001BuildDAO.getInfoClR();
		return clRInfo;
	}

	@Override
	public List<Map<String, Object>> selectBulnfo() {
		List bulInfo=null;
		bulInfo = d001BuildDAO.getInfoBUL();
		return bulInfo;
	}

	//강의실등록에서 건물이름 받아오기
	@Override
	public List<Map<String, Object>> selectBulName() {
		List bulName=null;
		bulName = d001BuildDAO.getBulName();
		return bulName;
	}

	//강의실 등록하기
	@Override
	public void insertClR(D001BuildVO d001BuildVO) {
		d001BuildDAO.insertClR(d001BuildVO);
		String getBulId = d001BuildVO.getBulId();
	}
	

}
	
	
	

	

