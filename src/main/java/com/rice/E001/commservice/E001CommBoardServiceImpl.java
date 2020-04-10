package com.rice.E001.commservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.E001.commdao.E001CommBoardDAO;
import com.rice.E001.commvo.E001CommBoardVO;

@Service
public class E001CommBoardServiceImpl implements E001CommBoardService {

	@Autowired
	private E001CommBoardDAO e001CommBoardDAO;

	@Override
	public int getTotal() {

		return e001CommBoardDAO.getTotal();
	}

	@Override
	public E001CommBoardVO read(String boNum) {
		//e001CommBoardDAO.updateViewCnt(boNum);
		return e001CommBoardDAO.read(boNum);
	}

	@Override
	public List<E001CommBoardVO> getList(Criteria cri) {
		return e001CommBoardDAO.getListWithPaging(cri);
	}

	@Override
	public boolean delete(String boNum) {
		return e001CommBoardDAO.delete(boNum) == 1;
	}

	@Override
	public boolean update(E001CommBoardVO vo) {
		// TODO Auto-generated method stub
		return e001CommBoardDAO.update(vo) == 1;
	}

	@Override
	public int updateViewCnt(String boNum) {
		// TODO Auto-generated method stub
		return e001CommBoardDAO.updateViewCnt(boNum);
	}

}
