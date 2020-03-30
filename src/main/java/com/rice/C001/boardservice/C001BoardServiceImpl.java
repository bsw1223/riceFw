package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001BoardDAO;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardvo.C001BoardVO;

@Service
public class C001BoardServiceImpl implements C001BoardService {

	@Autowired
	private C001BoardDAO c001BoardDAO;
	

	
	@Override

	public List<C001BoardVO> listBoard() {
		List boardlist=null;
		boardlist = c001BoardDAO.boardList();
		
		return boardlist;
	}
	
	@Override
	public void register(C001BoardVO vo) {
		c001BoardDAO.insertSelectKey(vo);

	}
	
	@Override
	 public int getTotal() {
	      return c001BoardDAO.getTotal();
	   }

	@Override
	public List<C001BoardVO> getSelectOne(int bno) {
		List<C001BoardVO> selectOne=null;
		selectOne=c001BoardDAO.getSelectOne(bno);
		
		return selectOne;
	}


}
