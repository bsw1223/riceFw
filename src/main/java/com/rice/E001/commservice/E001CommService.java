package com.rice.E001.commservice;

import com.rice.E001.commvo.E001CommVO;

public interface E001CommService {

	public void commReg(E001CommVO vo);
	
	public int urlCheck(String commURL) throws Exception;
	
	public int nameCheck(String commName) throws Exception;

}
