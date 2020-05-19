package com.rice.E001.commservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001CommBoardVO;
import com.rice.E001.commvo.E001FileUploadVO;

public interface E001CommBoardService {

	public int getTotal(Criteria cri);

	public E001CommBoardVO read(String boNum, String commURL);

	public List<E001CommBoardVO> getList(Criteria cri);
	
	public List<E001CommBoardVO> getSearchList(Criteria cri);

	public boolean delete(String boNum, String commURL);

	public boolean update(E001CommBoardVO boardvo);
	
	public int updateViewCnt(String boNum, String commURL);
	
	public String getCommName(String commURL);
	
	public List<E001FileUploadVO> getAttachList(String boNum);
	
	public void register(E001CommBoardVO boardvo);
	
	public int like(String memNum, String boNum);
	
	public int delLike(String memNum, String boNum);
	
	public int updateLikeCnt(String memNum, String boNum);
	
	public int updatedisLikeCnt(String memNum, String boNum);
	
	public int likeCheck(String boNum, String memNum) throws Exception;
	
	public int checkMem(String boNum, String commURL);

}
