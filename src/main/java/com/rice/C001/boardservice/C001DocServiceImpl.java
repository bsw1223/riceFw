package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001DocDAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
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
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return c001DocDAO.getTotal(cri);
	}

	@Override
	public C001ClassBoardVO read(String boNum, String boURL,String boCode) {
		// TODO Auto-generated method stub
		return c001DocDAO.read(boNum, boURL,boCode);
	}
	
	@Override
	public int updateViewCnt(String boNum, String boURL, String boCode) {
		// TODO Auto-generated method stub
		return c001DocDAO.updateViewCnt(boNum,boURL,boCode);
	}
	@Override
	public void register(C001ClassBoardVO vo) {
		c001DocDAO.insertSelectKey(vo);

	}

	@Override
	public boolean delete(String boNum, String boURL, String boCode) {

		return c001DocDAO.delete(boNum, boURL, boCode) == 1;
	}

	@Override
	public boolean update(C001ClassBoardVO vo) {
		// TODO Auto-generated method stub
		return c001DocDAO.update(vo) == 1;
	}

}
