package com.rice.E001.commservice;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
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
		
		return e001CommBoardDAO.read(boNum);
	}

	@Override
	public List<E001CommBoardVO> getList(Criteria cri) {

		return e001CommBoardDAO.getListWithPaging(cri);
	}

	
}
