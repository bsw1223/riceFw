package com.rice.D001.buildingservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingdao.D001BuildingDAO;
import com.rice.D001.buildingvo.D001BuildingVO;

@Service
public class D001BuildingServiceImpl implements D001BuildingService {

	@Autowired
	private D001BuildingDAO d001BuildingDAO;

	@Override
	public D001BuildingVO read(String bulId) {
		// TODO Auto-generated method stub
		return d001BuildingDAO.read(bulId);
	}

	@Override
	public boolean delete(String bulId) {
		// TODO Auto-generated method stub
		return d001BuildingDAO.delete(bulId) == 1;
	}

	@Override
	public boolean update(D001BuildingVO buildingvo) {
		// TODO Auto-generated method stub
		return d001BuildingDAO.update(buildingvo) == 1;
	}

	@Override
	public List<D001BuildingVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return d001BuildingDAO.getListWithPaging(cri);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return d001BuildingDAO.getTotal();
	}
	
	
	//-------------------------------------------------
	


	@Override
	public List<Map<String, Object>> selectInfo(String bulId) {
		List buildInfo=null;
		buildInfo = d001BuildingDAO.getInfo(bulId);
		return buildInfo;
	}
	
	@Override
	public List<Map<String, Object>> selectBulnfo() {
		List bulInfo=null;
		bulInfo = d001BuildingDAO.getInfoBUL();
		return bulInfo;
	}

	@Override
	public List<D001BuildingVO> insertBulidInfo(D001BuildingVO buildingvo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
