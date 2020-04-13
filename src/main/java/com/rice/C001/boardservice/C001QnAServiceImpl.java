package com.rice.C001.boardservice;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001QnADAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.qnavo.C001QnAVO;

@Service
public class C001QnAServiceImpl implements C001QnAService {
	
	@Autowired
	private C001QnADAO c001QnADAO;

	@Override
	public void insert(C001QnAVO vo) {

		c001QnADAO.insert(vo);
	}

	@Override
	public List<C001QnAVO> listAll(Criteria cri) {

		return c001QnADAO.getListWithPaging(cri);
	}

	@Override
	public C001QnAVO read(String boNum) {

		return c001QnADAO.read(boNum);
	}

	@Override
	public void delete(String boNum) {

		c001QnADAO.delete(boNum);
	}

	@Override
	public void modify(C001QnAVO vo) {
	
		c001QnADAO.modify(vo);
	}


	@Override
	public int getTotal() {

		return c001QnADAO.getTotal();
	}
}
