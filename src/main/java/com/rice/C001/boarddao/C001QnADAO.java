package com.rice.C001.boarddao;

import java.util.List;
import java.util.Map;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.qnavo.C001QnAVO;


public interface C001QnADAO {
	
	
	public List<C001QnAVO> listAll();
	
	public int getTotal();
	
	public C001QnAVO read(String boNum);
	
	public void delete(String boNum);
	
	public void modify(C001QnAVO vo);

	public void insert(C001QnAVO vo);
	
	/* public void insertSelectKey(C001QnAVO vo); */
	
	public List<C001QnAVO> getListWithPaging(Criteria cri);

	public void insertFile(Map<String, Object> map);

	
}
