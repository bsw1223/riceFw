package com.rice.C001.boarddao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
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
	public C001BoardVO read(Long bno) {

		return sqlsession.selectOne("mapper.board.read",bno);
	
		
	}


	@Override
	public int delete(Long bno) {

		return sqlsession.delete("mapper.board.delete",bno);
	
	}
	
	@Override
	public int update(C001BoardVO vo) {
		return sqlsession.update("mapper.board.update",vo);
	}


	@Override
	public List<C001BoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.board.getListWithPaging",cri);
	}


	@Override
	public List<C001BoardVO> getSelectOne(int bno) {
		List<C001BoardVO> c001BoardDAO = null;
		System.out.println("dao �뙆�씪誘명꽣:"+bno);
		c001BoardDAO = sqlsession.selectList("mapper.board.getSelectOne", bno);
		return c001BoardDAO;
	}
}
