package com.rice.E001.commservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.replyvo.C001ReplyVO;
import com.rice.D001.buildingvo.D001BuildingVO;
import com.rice.E001.commvo.E001CommBoardVO;
import com.rice.E001.commvo.E001CommVO;

public interface E001CommBoardService {

	public int getTotal();
	
	public E001CommBoardVO read(String boNum);
	
	public List<E001CommBoardVO> getList(Criteria cri);

}
