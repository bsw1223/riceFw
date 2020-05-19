package com.rice.C001.boardservice;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.C001.boardvo.C001FileUploadVO;

public interface C001DocService {

	List<C001ClassBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	public  C001ClassBoardVO read(String boNum,String boURL, String boCode);
	
	public int updateViewCnt(String boNum, String boURL, String boCode);

	public void register(C001ClassBoardVO boardvo);
	
	public boolean delete(String boNum, String boURL, String boCode);

	public boolean update(C001ClassBoardVO boardvo);
	
	List<A001MemVO> getStdList(Criteria cri);
	
	public String getsbjc(String boURL);
	
	public List<C001FileUploadVO> getAttachList(String boNum);
	
}
