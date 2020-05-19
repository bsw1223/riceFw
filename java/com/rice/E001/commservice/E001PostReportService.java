package com.rice.E001.commservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001PostReportVO;

public interface E001PostReportService {
	
	public List<E001PostReportVO> getList(Criteria cri);
	
	public int getTotal();
}
