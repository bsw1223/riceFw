package com.rice.C001.boarddao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardvo.C001BoardVO;




@Repository
public class C001BoardDAOImpl implements C001BoardDAO {
	
	
	
	@Autowired
	private SqlSession sqlsession;

	private C001BoardDAO c001BoardDAO;


	
	
	@Override
	public List<C001BoardVO> boardList() {
		
		List<C001BoardVO> list = null;
		
		list= sqlsession.selectList("mapper.board.listBoard");

		return list;
	}



	@Override
	public void insertSelectKey(C001BoardVO vo) {
		
	

		
		
		System.out.println("AAA");
		
		
		sqlsession.insert("mapper.board.insertSelectKey",vo);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		int page;
		page=sqlsession.selectOne("mapper.board.getTotal");
		
		return page;
	}

	@Override
	public List<C001BoardVO> getSelectOne(int bno) {
		List<C001BoardVO> c001BoardDAO = null;
		System.out.println("dao 파라미터:"+bno);
		c001BoardDAO = sqlsession.selectList("mapper.board.getSelectOne", bno);
		return c001BoardDAO;
	}
	
}
