
package com.rice.C001.boarddao;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;

public interface C001DocDAO {

	List<C001ClassBoardVO> getListWithPaging(Criteria cri);

	int getTotal(Criteria cri);
	
	public C001ClassBoardVO read(String boNum, String boURL, String boCode);
	
	public int updateViewCnt(String boNum, String boURL, String boCode);
	
	public void insertSelectKey(C001ClassBoardVO vo);
	
	public int delete(String boNum, String boURL, String boCode);

	public int update(C001ClassBoardVO vo);
	
	List<A001MemVO> getStdListWithPaging(Criteria cri);
	
	public String subjectName(String boURL);

}
