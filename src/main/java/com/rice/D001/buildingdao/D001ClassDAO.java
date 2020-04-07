package com.rice.D001.buildingdao;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001ClassVO;

public interface D001ClassDAO {
	
	public List<D001ClassVO> getListWithPaging(Criteria cri);
	
	public int getTotal();

	public D001ClassVO read(String classId);

	public int delete (String classId); 
	
	public int update(D001ClassVO vo);
}
