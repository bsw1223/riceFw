
package com.rice.E001.commdao;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.C001.boardvo.C001FileUploadVO;
import com.rice.E001.commvo.E001FileUploadVO;

public interface E001FileDAO {

	public void insert(E001FileUploadVO vo);

	public void delete(String boNum);

	public List<E001FileUploadVO> findByboNum(String boNum);

}
