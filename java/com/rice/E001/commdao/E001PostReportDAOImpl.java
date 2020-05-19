package com.rice.E001.commdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001PostReportVO;

@Repository
public class E001PostReportDAOImpl implements E001PostReportDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int getTotal() {

		int page;

		page = sqlsession.selectOne("mapper.post.getTotal");
		return page;
	}
	
	@Override
	public List<E001PostReportVO> getListWithPaging(Criteria cri) {

		return sqlsession.selectList("mapper.post.getListWithPaging", cri);
	}
}
