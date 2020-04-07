package com.rice.D001.buildingservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingdao.D001ClassDAO;
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
		return d001ClassDAO.delete(classId)==1;
	}

	@Override
	public boolean update(D001ClassVO classvo) {
		// TODO Auto-generated method stub
		return d001ClassDAO.update(classvo)==1;
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
	
}
