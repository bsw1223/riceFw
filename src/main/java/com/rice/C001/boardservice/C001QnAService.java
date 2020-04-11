package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.qnavo.C001QnAVO;



public interface C001QnAService {
	
	public void insert(C001QnAVO vo);
	
	public int getTotal();
	
	public List<C001QnAVO> listAll(Criteria cri);
	
	public C001QnAVO read(String boNum);
	
	public void delete(String boNum);
	
	public void modify(C001QnAVO vo);
	
}
