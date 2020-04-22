package com.rice.H001.homeservice;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rice.H001.homedao.H001SchDAO;
import com.rice.H001.homevo.H001SchVO;

@Service
public class H001SchServiceImpl implements H001SchService{
	
	@Autowired
	private H001SchDAO h001SchDAO;
		

	@Override
	public List<Map<String, Object>> selectSchList(String memNum) {
		List subJectInfo=null;
		subJectInfo = h001SchDAO.selectSchList(memNum);
		return subJectInfo;
	}

	//스케쥴 수정
	@Override
	public void ModifySchInfo(H001SchVO h001SchVO) {
		
		h001SchDAO.ModifySchInfo(h001SchVO);
		
	}
	//desc가져오기
	@Override
	public Map<String, Object> selectDesc(H001SchVO h001SchVO) {
		Map<String, Object> map = h001SchDAO.selectDesc(h001SchVO);
		return map;
	}

	//새 달력 클릭 시 시퀀스 넘버 가져오기
	@Override
	public Map<String, Object> selectSchSeqNo() {
		Map<String, Object> map = h001SchDAO.selectSchSeqNo();
		return map;
	}
	
	//insert schedule info
	@Override
	public void insertSchInfo(H001SchVO h001SchVO) {

		h001SchDAO.insertSchInfo(h001SchVO);
		
	}
	
	//delete SchInfo
	@Override
	public void deleteSchInfo(H001SchVO h001SchVO) {
		h001SchDAO.deleteSchInfo(h001SchVO);
	}

	
	
}
