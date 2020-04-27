package com.rice.E001.commdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.E001.commvo.E001CommBoardVO;

@Repository
public class E001CommBoardDAOImpl implements E001CommBoardDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public int getTotal() {

		int page;

		page = sqlsession.selectOne("mapper.commboard.getTotal");
		return page;
	}

	@Override
	public E001CommBoardVO read(String boNum) {

		return sqlsession.selectOne("mapper.commboard.read", boNum);
	}

	@Override
	public List<E001CommBoardVO> getListWithPaging(Criteria cri, String commURL) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("commURL", commURL);

		return sqlsession.selectList("mapper.commboard.getListWithPaging", map);
	}

	@Override
	public int delete(String boNum) {
		return sqlsession.delete("mapper.commboard.delete", boNum);

	}

	@Override
	public int update(E001CommBoardVO vo) {
		return sqlsession.update("mapper.commboard.update", vo);
	}

	@Override
	public void insertSelectKey(E001CommBoardVO vo) {

		sqlsession.insert("mapper.commboard.insertSelectKey", vo);
	}

	@Override
	public int updateViewCnt(String boNum) {
		
		return sqlsession.update("mapper.commboard.updateViewCnt",boNum);
		
	}

}
