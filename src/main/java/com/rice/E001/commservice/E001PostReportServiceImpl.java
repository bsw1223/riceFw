package com.rice.E001.commservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commdao.E001PostReportDAO;
import com.rice.E001.commvo.E001PostReportVO;

@Service
public class E001PostReportServiceImpl implements E001PostReportService{

	@Autowired
	private E001PostReportDAO e001PostReportDAO;
	
	@Override
	public List<E001PostReportVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return e001PostReportDAO.getListWithPaging(cri);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return e001PostReportDAO.getTotal();
	}

}
