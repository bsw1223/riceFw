
package com.rice.C001.boarddao;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.C001.boardvo.C001FileUploadVO;

public interface C001FileDAO {

	public void insert(C001FileUploadVO vo);

	public void delete(String boNum);

	public List<C001FileUploadVO> findByboNum(String boNum);

}
