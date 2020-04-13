package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001DocDAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001ClassBoardVO;

@Service
public class C001DocServiceImpl implements C001DocService {
	
	@Autowired
	private C001DocDAO c001DocDAO;

	@Override
	public List<C001ClassBoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return c001DocDAO.getListWithPaging(cri);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return c001DocDAO.getTotal();
	}

	@Override
	public C001ClassBoardVO read(String boNum) {
		// TODO Auto-generated method stub
		return c001DocDAO.read(boNum);
	}

}
