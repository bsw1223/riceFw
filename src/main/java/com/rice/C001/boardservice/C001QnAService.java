package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.qnavo.C001QnAVO;



public interface C001QnAService {
	
	public int getTotal();
	
	public List<C001QnAVO> listAll(Criteria cri);
	
	public C001QnAVO read(String boNum);
	
	public void delete(String boNum);
	
	public void modify(C001QnAVO vo);

	public void insert(C001QnAVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
}
