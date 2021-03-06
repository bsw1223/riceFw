package com.rice.D001.buildingdao;

import java.util.List;
import java.util.Map;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001BuildingVO;

public interface D001BuildingDAO {

	public List<D001BuildingVO> getListWithPaging(Criteria cri);

	public int getTotal();

	public D001BuildingVO read(String bulId);

	public int delete(String bulId);

	public int update(D001BuildingVO vo);
	
	
	
	//--------------------------------------------------------
	public List<Map<String, Object>> getInfo(String bulId);
	
	
	public List<Map<String, Object>> getInfoBUL();
	
	
	public void insertBulInfo(Map<String, Object> vo);
	

	
}
