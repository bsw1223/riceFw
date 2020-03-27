package com.rice.C001.boarddao;

import java.util.List;


import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardvo.C001BoardVO;



public interface C001BoardDAO {
	

	public List<C001BoardVO> boardList();
	
	public void insertSelectKey(C001BoardVO vo);
	
	public int getTotal();
}
