package com.rice.E001.commdao;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001CommBoardVO;
import com.rice.E001.commvo.E001CommVO;

public interface E001CommBoardDAO {

	public int getTotal();

	public E001CommBoardVO read(String boNum);

	public List<E001CommBoardVO> getListWithPaging(Criteria cri);
	
}
