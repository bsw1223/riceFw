package com.rice.C001.boarddao;

import java.util.List;

import com.rice.C001.boardvo.C001BoardVO;



public interface C001BoardDAO {

	public List<C001BoardVO> boardList();
	
	public void registerBoard(C001BoardVO boardvo);
}
