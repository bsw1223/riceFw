
package com.rice.C001.boarddao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;

@Repository
public class C001DocDAOImpl implements C001DocDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<C001ClassBoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.myboard.getListWithPaging", cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		int page;
		page = sqlsession.selectOne("mapper.myboard.getTotal", cri);
		return page;
	}

	@Override
	public C001ClassBoardVO read(String boNum, String boURL, String boCode) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boURL", boURL);
		map.put("boNum", boNum);
		map.put("boCode", boCode);
		return sqlsession.selectOne("mapper.myboard.read", map);
	}
	
	@Override
	public int updateViewCnt(String boNum, String boURL, String boCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boURL", boURL);
		map.put("boNum", boNum);
		map.put("boCode", boCode);
		
		return sqlsession.update("mapper.myboard.updateViewCnt",map);
		
	}
	
	@Override
	public void insertSelectKey(C001ClassBoardVO vo) {

		sqlsession.insert("mapper.myboard.insertSelectKey", vo);
	}
	
	@Override
	public int delete(String boNum, String boURL, String boCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boURL", boURL);
		map.put("boNum", boNum);
		map.put("boCode", boCode);
		return sqlsession.delete("mapper.myboard.delete", map);

	}

	@Override
	public int update(C001ClassBoardVO vo) {
		return sqlsession.update("mapper.myboard.update", vo);
	}

}
