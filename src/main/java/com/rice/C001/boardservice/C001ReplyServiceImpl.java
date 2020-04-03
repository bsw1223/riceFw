package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddao.C001ReplyDAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.replyvo.C001ReplyVO;



@Service
public class C001ReplyServiceImpl implements C001ReplyService{

	@Autowired
	private C001ReplyDAO c001ReplyDAO;

	@Override
	public int register(C001ReplyVO vo) {
		
		return c001ReplyDAO.insert(vo);
	}

	@Override
	public C001ReplyVO get(Long bno) {
		// TODO Auto-generated method stub
		return c001ReplyDAO.read(bno);
	}

	@Override
	public int modify(C001ReplyVO vo) {
		// TODO Auto-generated method stub
		return c001ReplyDAO.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return c001ReplyDAO.delete(rno);
	}

	@Override
	public List<C001ReplyVO> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return c001ReplyDAO.getListWithPaging(cri,bno);
	}
	
	
}
