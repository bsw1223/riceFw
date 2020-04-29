package com.rice.C001.boardservice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.qnavo.C001QnAVO;
import com.rice.C001.qnavo.classattachedFileVO;



public interface C001QnAService {
	
	public int getTotal();
	
	public List<C001QnAVO> listAll(Criteria cri);
	
	public C001QnAVO read(String boNum);
	
	public void delete(String boNum);
	
	public void modify(C001QnAVO vo,String[] files,
						String[] fileNames,
						MultipartHttpServletRequest mpRequest)throws Exception;

	public void insert(C001QnAVO vo,MultipartHttpServletRequest mpRequest) throws Exception;
	
	public List<Map<String, Object>> selectFilelList(String boNum)throws Exception;

	public Map<String, Object> selectFileInfo(Map<String, Object>map)throws Exception;
}
