package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boardvo.C001BoardVO;

public interface C001BoardService {

	public List<C001BoardVO> listBoard();
	
	public void register(C001BoardVO boardvo);
}