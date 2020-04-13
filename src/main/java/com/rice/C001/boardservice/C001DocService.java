package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001ClassBoardVO;

public interface C001DocService {

	List<C001ClassBoardVO> getList(Criteria cri);
	
	public int getTotal();

	public  C001ClassBoardVO read(String boNum);

}
