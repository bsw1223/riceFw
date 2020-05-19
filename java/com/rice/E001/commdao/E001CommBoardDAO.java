package com.rice.E001.commdao;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001CommBoardVO;

public interface E001CommBoardDAO {

	public int getTotal(Criteria cri);

	public E001CommBoardVO read(String boNum, String commURL);

	public List<E001CommBoardVO> getListWithPaging(Criteria cri);
	
	public List<E001CommBoardVO> searchComm(Criteria cri);

	public int delete(String boNum, String commURL);

	public int update(E001CommBoardVO vo);

	public void insertSelectKey(E001CommBoardVO vo);

	public int updateViewCnt(String boNum, String commURL);
	
	public int updatedisLikeCnt(String boNum, String commURL);
	
	public String getCommName(String commURL);
	
	public int like(String memNum, String boNum);
	
	public int delLike(String memNum, String boNum);
	
	public int updateLikeCnt(String memNum, String boNum);
	
	public int likeCheck(String boNum, String memNum) throws Exception;
	
	public int checkMem(String boNum, String commURL);

}
