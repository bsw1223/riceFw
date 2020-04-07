package com.rice.E001.commdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.E001.commvo.E001CommBoardVO;

@Repository
public class E001CommBoardDAOImpl implements E001CommBoardDAO {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public int getTotal() {
		
		int page;
		
		page =sqlsession.selectOne("mapper.commboard.getTotal");
		return page;
	}

	@Override
	public E001CommBoardVO read(String boNum) {
		
		return sqlsession.selectOne("mapper.commboard.read",boNum);
	}

	@Override
	public List<E001CommBoardVO> getListWithPaging(Criteria cri) {
		
		return sqlsession.selectList("mapper.commboard.getListWithPaging", cri);
	}

}
