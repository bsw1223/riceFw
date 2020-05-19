package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001ComtDAO;
import com.rice.C001.boarddao.C001ReplyDAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001CommentVO;
import com.rice.C001.replyvo.C001ReplyVO;

@Service
public class C001ComtServiceImpl implements C001ComtService {

	@Autowired
	private C001ComtDAO c001comtDAO;

	@Override
	public int register(C001CommentVO vo) {

		return c001comtDAO.insert(vo);
	}

	@Override
	public C001CommentVO get(String boNum) {
		// TODO Auto-generated method stub
		return c001comtDAO.read(boNum);
	}

	@Override
	public int modify(C001CommentVO vo) {
		// TODO Auto-generated method stub
		return c001comtDAO.update(vo);
	}

	@Override
	public int remove(String comtNum) {
		// TODO Auto-generated method stub
		return c001comtDAO.delete(comtNum);
	}

	@Override
	public List<C001CommentVO> getList(Criteria cri, String boNum) {
		// TODO Auto-generated method stub
		return c001comtDAO.getListWithPaging(cri, boNum);
	}

}
