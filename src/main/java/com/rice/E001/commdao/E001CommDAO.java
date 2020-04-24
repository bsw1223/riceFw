package com.rice.E001.commdao;


import com.rice.E001.commvo.E001CommVO;

public interface E001CommDAO {

	public void insertSelectKey(E001CommVO vo);
	
	public int urlCheck(String commURL) throws Exception;
	
	public int nameCheck(String commName) throws Exception;

}
