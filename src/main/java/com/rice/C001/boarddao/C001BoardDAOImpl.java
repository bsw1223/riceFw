package com.rice.C001.boarddao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boardvo.C001BoardVO;

@Repository
public class C001BoardDAOImpl implements C001BoardDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<C001BoardVO> boardList() {
		
		List<C001BoardVO> list = null;
		
		list= sqlsession.selectList("mapper.board.listBoard");

		return list;
	}
	
	@Override
	public void registerBoard(C001BoardVO boardvo) {
		
		sqlsession.insert("mapper.board.insert");
	}

}
