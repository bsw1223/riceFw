package com.rice.D001.buildingdao;

import java.util.List;
import java.util.Map;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001BuildingVO;
import com.rice.D001.buildingvo.D001ClassVO;

public interface D001ClassDAO {

	public List<D001ClassVO> getListWithPaging(Criteria cri);

	public int getTotal();

	public D001ClassVO read(String classId);

	public int delete(String classId);

	public int update(D001ClassVO vo);


//-------------------------------------------
	public List<Map<String, Object>> getInfoClass(String classId);

	public List<Map<String, Object>> getInfoClR();

	public void insertClR(D001BuildingVO d001BuildingVO);

	public List<Map<String, Object>> getBulName();

	public void insertBuilding(D001BuildingVO d001BuildingVO);
}
