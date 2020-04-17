package com.rice.C001.boardservice;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rice.C001.boarddao.C001QnADAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.qnavo.C001QnAVO;
import com.rice.util.FileUtils;

@Service
public class C001QnAServiceImpl implements C001QnAService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private C001QnADAO c001QnADAO;

	@Override
	public void insert(C001QnAVO vo, MultipartHttpServletRequest mpRequest) throws Exception {

		c001QnADAO.insert(vo);
		
		List<Map<String, Object>> list = fileUtils.parseinsertfileinfo(vo, mpRequest);
		int size = list.size();
		for(int i =0;i<size;i++) {
			c001QnADAO.insertFile(list.get(i));
		}
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
