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
	
	
	/*
	 * @Override public List<C001BoardVO> boardList() {
	 * 
	 * List<C001BoardVO> list = null;
	 * 
	 * list= sqlsession.selectList("mapper.board.listBoard");
	 * 
	 * return list; }
	 */
	


	@Override
	public void create(C001BoardVO boardvo) throws Exception {

		sqlsession.insert("mapper.board.insert");
	}

	@Override
	public C001BoardVO read(Long bno) throws Exception {

		sqlsession.selectOne("mapper.board.read");
		
		return null;
	}

	@Override
	public void delete(Long bno) throws Exception {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}ption {

		sqlsession.delete("mapper.board.delete");
	}

	@Override
	public void update(C001BoardVO boardvo)throws Exception {

		sqlsession.update("mapper.board.update");
	}

	@Override
	public List<C001BoardVO> listBoard() throws Exception {

		sqlsession.selectList("mapper.board.listBoard");
		
		return null;
	}



}
