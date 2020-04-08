package com.rice.D001.buildingservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001ClassVO;

public interface D001ClassService {

	public int getTotal();

	public D001ClassVO read(String classId);

	public boolean delete(String classId);

	public boolean update(D001ClassVO buildingvo);

	public List<D001ClassVO> getList(Criteria cri);
}
