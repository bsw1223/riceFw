package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001ComtDAO;
import com.rice.C001.boarddao.C001FileDAO;
import com.rice.C001.boarddao.C001ReplyDAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001CommentVO;
import com.rice.C001.boardvo.C001FileUploadVO;
import com.rice.C001.replyvo.C001ReplyVO;

@Service
public class C001FileServiceImple implements C001FileService {

	@Autowired
	private C001FileDAO c001fileDAO;

	@Override
	public void insert(C001FileUploadVO vo) {
		c001fileDAO.insert(vo);
		
	}

	@Override
	public void delete(String saveFileName) {
		c001fileDAO.delete(saveFileName);
	}

	@Override
	public List<C001FileUploadVO> findByboNum(String boNum) {
		// TODO Auto-generated method stub
		return c001fileDAO.findByboNum(boNum);
	}

	

}
