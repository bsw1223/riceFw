package com.rice.C001.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddao.C001DocDAO;
import com.rice.C001.boarddao.C001FileDAO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.C001.boardvo.C001FileUploadVO;
@Transactional
@Service
public class C001DocServiceImpl implements C001DocService {
	
	@Autowired
	private C001DocDAO c001DocDAO;
	
	@Autowired
	private C001FileDAO c001fileDAO;

	@Override
	public List<C001ClassBoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return c001DocDAO.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return c001DocDAO.getTotal(cri);
	}

	@Override
	public C001ClassBoardVO read(String boNum, String boURL,String boCode) {
		// TODO Auto-generated method stub
		return c001DocDAO.read(boNum, boURL,boCode);
	}
	
	@Override
	public int updateViewCnt(String boNum, String boURL, String boCode) {
		// TODO Auto-generated method stub
		return c001DocDAO.updateViewCnt(boNum,boURL,boCode);
	}
	@Override
	public void register(C001ClassBoardVO vo) {
		System.out.println("service....");
		c001DocDAO.insertSelectKey(vo);
		
		if(vo.getFilelist() ==null || vo.getFilelist().size() <= 0) {
			return;
		}
		vo.getFilelist().forEach(attach->{
			attach.setBoNum(vo.getBoNum());
			c001fileDAO.insert(attach);
		});
		

	}

	@Override
	public boolean delete(String boNum, String boURL, String boCode) {
		c001fileDAO.delete(boNum);
		return c001DocDAO.delete(boNum, boURL, boCode) == 1;
	}

	@Override
	public boolean update(C001ClassBoardVO vo) {
		// TODO Auto-generated method stub
		c001fileDAO.delete(vo.getBoNum());
		
		boolean modifyResult = c001DocDAO.update(vo)==1;
		
		if(modifyResult && vo.getFilelist() != null && vo.getFilelist().size() > 0) {
			vo.getFilelist().forEach(attach->{
				attach.setBoNum(vo.getBoNum());
				c001fileDAO.insert(attach);
			});
		}
		return modifyResult;
	}
	
	@Override
	public List<A001MemVO> getStdList(Criteria cri) {
		// TODO Auto-generated method stub
		return c001DocDAO.getStdListWithPaging(cri);
	}

	@Override
	public String getsbjc(String boURL) {
		// TODO Auto-generated method stub
		return c001DocDAO.subjectName(boURL);
	}
	
	@Override
	public List<C001FileUploadVO> getAttachList(String boNum){
		return c001fileDAO.findByboNum(boNum);
	}

}
