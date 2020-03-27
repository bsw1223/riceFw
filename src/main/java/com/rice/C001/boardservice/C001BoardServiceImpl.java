package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001BoardDAO;
import com.rice.C001.boardvo.C001BoardVO;

@Service
public class C001BoardServiceImpl implements C001BoardService {

	@Autowired
	private C001BoardDAO c001BoardDAO;
	
	/*
	 * @Override public List<C001BoardVO> listBoard() { List boardlist=null;
	 * boardlist = c001BoardDAO.boardList();
	 * 
	 * return boardlist; }
	 */


	@Override
	public boolean delete(Long bno) throws Exception {
		
		c001BoardDAO.delete(bno);
		return false;
	}

	@Override
	public boolean update(C001BoardVO boardvo) throws Exception {

		c001BoardDAO.update(boardvo);
		return false;
	}

	@Override
	public void create(C001BoardVO boardvo) throws Exception {

		c001BoardDAO.create(boardvo);
	}

	@Override
	public C001BoardVO read(Long bno) throws Exception {

		return c001BoardDAO.read(bno);
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		return c001BoardDAO.listBoard();
	}


	

}
