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
		System.out.println("H001service subJectInfo : "+ subJectInfo);
		return subJectInfo;
	}

	//스케쥴 수정
	@Override
	public void ModifySchInfo(H001SchVO h001SchVO) {
		
		h001SchDAO.ModifySchInfo(h001SchVO);
		
	}

	
	
}
