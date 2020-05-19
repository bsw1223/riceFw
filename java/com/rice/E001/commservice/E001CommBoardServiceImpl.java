package com.rice.E001.commservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commdao.E001CommBoardDAO;
import com.rice.E001.commdao.E001FileDAO;
import com.rice.E001.commvo.E001CommBoardVO;
import com.rice.E001.commvo.E001FileUploadVO;

@Service
public class E001CommBoardServiceImpl implements E001CommBoardService {

	@Autowired
	private E001CommBoardDAO e001CommBoardDAO;
	
	@Autowired
	private E001FileDAO e001fileDAO;


	@Override
	public int getTotal(Criteria cri) {

		return e001CommBoardDAO.getTotal(cri);
	}

	@Override
	public E001CommBoardVO read(String boNum, String commURL) {

		return e001CommBoardDAO.read(boNum, commURL);
	}

	@Override
	public List<E001CommBoardVO> getList(Criteria cri) {
		
		return e001CommBoardDAO.getListWithPaging(cri);
	}
	
	@Override
	public List<E001CommBoardVO> getSearchList(Criteria cri) {
		
		return e001CommBoardDAO.searchComm(cri);
	}

	@Override
	public boolean delete(String boNum, String commURL) {
		e001fileDAO.delete(boNum);
		return e001CommBoardDAO.delete(boNum, commURL) == 1;
	}

	@Override
	public boolean update(E001CommBoardVO vo) {
		// TODO Auto-generated method stub
		e001fileDAO.delete(vo.getBoNum());
		
		boolean modifyResult = e001CommBoardDAO.update(vo)==1;
		if(modifyResult && vo.getFilelist() != null && vo.getFilelist().size() > 0) {
			vo.getFilelist().forEach(attach->{
				attach.setBoNum(vo.getBoNum());
				
				e001fileDAO.insert(attach);
			});
		}
		return modifyResult;
	}

	@Override
	public int updateViewCnt(String boNum, String commURL) {
		// TODO Auto-generated method stub
		return e001CommBoardDAO.updateViewCnt(boNum, commURL);
	}
	
	@Override
	public String getCommName(String commURL) {
		// TODO Auto-generated method stub
		return e001CommBoardDAO.getCommName(commURL);
	}
	@Override
	public List<E001FileUploadVO> getAttachList(String boNum){
		return e001fileDAO.findByboNum(boNum);
	}
	
	@Override
	public void register(E001CommBoardVO vo) {
		e001CommBoardDAO.insertSelectKey(vo);
		System.out.println(vo.getBoContent());
		if(vo.getFilelist() ==null || vo.getFilelist().size() <= 0) {
			return;
		}
		vo.getFilelist().forEach(attach->{
			attach.setBoNum(vo.getBoNum());
			e001fileDAO.insert(attach);
		});
		

	}

	@Override
	public int like(String memNum, String boNum) {
		// TODO Auto-generated method stub

		return e001CommBoardDAO.like(memNum, boNum);
	}
	
	@Override
	public int delLike(String memNum, String boNum) {
		// TODO Auto-generated method stub

		return e001CommBoardDAO.delLike(memNum, boNum);
	}

	@Override
	public int updateLikeCnt(String memNum, String boNum) {
		// TODO Auto-generated method stub
		return e001CommBoardDAO.updateLikeCnt(memNum, boNum);
	}
	

	@Override
	public int updatedisLikeCnt(String memNum, String boNum) {
		// TODO Auto-generated method stub
		return e001CommBoardDAO.updatedisLikeCnt(memNum, boNum);
	}
	
	@Override
	public int likeCheck(String boNum, String memNum) throws Exception {
		return e001CommBoardDAO.likeCheck(boNum, memNum);
	} 
	
	@Override
	public int checkMem(String boNum, String commURL) {
		return e001CommBoardDAO.checkMem(boNum, commURL);
	} 
	


}
