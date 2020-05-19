package com.rice.E001.commdao;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001PostReportVO;


public interface E001PostReportDAO {
	
	public int getTotal();
	
	public List<E001PostReportVO> getListWithPaging(Criteria cri);
}
