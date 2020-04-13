package com.rice.E001.commservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001CommBoardVO;

public interface E001CommBoardService {

	public int getTotal();

	public E001CommBoardVO read(String boNum);

	public List<E001CommBoardVO> getList(Criteria cri);

	public boolean delete(String boNum);

	public boolean update(E001CommBoardVO boardvo);
	
	public int updateViewCnt(String boNum);

}
