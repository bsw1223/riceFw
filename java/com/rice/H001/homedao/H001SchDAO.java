package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import com.rice.H001.homevo.H001HomeVO;
import com.rice.H001.homevo.H001SchVO;

public interface H001SchDAO {
	public List<Map<String, Object>> selectSchList(String memNum);
	
	public void ModifySchInfo(H001SchVO h001SchVO);
	
	public Map<String, Object> selectDesc(H001SchVO h001SchVO);
	
	//시퀀스 넘버 가져오는 프로세스
	public Map<String, Object> selectSchSeqNo();
	
	//insert 스케쥴 info
	public void insertSchInfo(H001SchVO h001SchVO);
	
	//delete SchInfo
	public void deleteSchInfo(H001SchVO h001SchVO);
	
	
}
