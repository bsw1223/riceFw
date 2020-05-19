package com.rice.E001.commservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.E001.commdao.E001CommDAO;

import com.rice.E001.commvo.E001CommVO;

@Service
public class E001CommServiceImpl implements E001CommService {

	@Autowired
	private E001CommDAO e001CommDAO;

	@Override
	public void commReg(E001CommVO vo) {
		e001CommDAO.insertSelectKey(vo);
	}
	
	@Override
	public int urlCheck(String commURL) throws Exception {
		return e001CommDAO.urlCheck(commURL);
	} 
	
	@Override
	public int nameCheck(String commName) throws Exception {
		return e001CommDAO.nameCheck(commName);
	} 
}
