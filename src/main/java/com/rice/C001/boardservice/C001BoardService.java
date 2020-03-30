package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;

public interface C001BoardService {
	
	public List<C001BoardVO> listBoard();
	
	public void register(C001BoardVO boardvo);
	
	public int getTotal();
	
	public C001BoardVO read(Long bno);
	
	public boolean delete(Long bno);
	
	public boolean update(C001BoardVO boardvo);
	
	public List<C001BoardVO> getList(Criteria cri);
	
	
}
