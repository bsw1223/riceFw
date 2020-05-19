package com.rice.D001.buildingservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingdao.D001ClassDAO;
import com.rice.D001.buildingvo.D001BuildingVO;
import com.rice.D001.buildingvo.D001ClassVO;

@Service
public class D001ClassServiceImpl implements D001ClassService {

	@Autowired
	private D001ClassDAO d001ClassDAO;

	@Override
	public D001ClassVO read(String classId) {
		// TODO Auto-generated method stub
		return d001ClassDAO.read(classId);
	}

	@Override
	public boolean delete(String classId) {
		// TODO Auto-generated method stub
		return d001ClassDAO.delete(classId) == 1;
	}

	@Override
	public boolean update(D001ClassVO classvo) {
		// TODO Auto-generated method stub
		return d001ClassDAO.update(classvo) == 1;
	}

	@Override
	public List<D001ClassVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return d001ClassDAO.getListWithPaging(cri);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return d001ClassDAO.getTotal();
	}

	
	
	
	//---------------------------------------------------

	//강의실 등록하기
	@Override
	public void insertClR(D001BuildingVO D001BuildingVO) {
		d001ClassDAO.insertClR(D001BuildingVO);
		String getBulId = D001BuildingVO.getBulId();
	}
	
	//강의실세부 정보읽어오기
	@Override
	public List<Map<String, Object>> selectClassInfo(String classId) {
		List classInfo=null;
		classInfo = d001ClassDAO.getInfoClass(classId);
		return classInfo;
	}

	
	//강의실 등록에서 강의실 종류받아오기
	@Override
	public List<Map<String, Object>> selectClRnfo() {
		List clRInfo=null;
		clRInfo = d001ClassDAO.getInfoClR();
		return clRInfo;
	}

	
	//강의실등록에서 건물이름 받아오기
		@Override
		public List<Map<String, Object>> selectBulName() {
			List bulName=null;
			bulName = d001ClassDAO.getBulName();
			return bulName;
		}

	
	

	
}
