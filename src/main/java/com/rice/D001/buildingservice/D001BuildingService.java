package com.rice.D001.buildingservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001BuildingVO;

public interface D001BuildingService {

	public int getTotal();

	public D001BuildingVO read(String bulId);

	public List<D001BuildingVO> getList(Criteria cri);

	public boolean delete(String bulId);

	public boolean update(D001BuildingVO buildingvo);

}
