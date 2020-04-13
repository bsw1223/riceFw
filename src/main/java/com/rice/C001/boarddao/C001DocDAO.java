
package com.rice.C001.boarddao;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001ClassBoardVO;

public interface C001DocDAO {

	List<C001ClassBoardVO> getListWithPaging(Criteria cri);

	int getTotal();
	
	public C001ClassBoardVO read(String boNum);

}
