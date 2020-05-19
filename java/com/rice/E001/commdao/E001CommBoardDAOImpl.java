package com.rice.E001.commdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int getTotal(Criteria cri) {
		int page;
		page = sqlsession.selectOne("mapper.commboard.getTotal",cri);
		return page;
	}

	@Override
	public E001CommBoardVO read(String boNum, String commURL) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commURL", commURL);
		map.put("boNum", boNum);
		return sqlsession.selectOne("mapper.commboard.read", map);
	}

	@Override
	public List<E001CommBoardVO> getListWithPaging(Criteria cri) {

		return sqlsession.selectList("mapper.commboard.getListWithPaging", cri);
	}
	
	@Override
	public List<E001CommBoardVO> searchComm(Criteria cri) {

		return sqlsession.selectList("mapper.commboard.searchComm", cri);
	}

	@Override
	public int delete(String boNum, String commURL) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commURL", commURL);
		map.put("boNum", boNum);
		return sqlsession.delete("mapper.commboard.delete", map);

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
	public int updateViewCnt(String boNum, String commURL) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commURL", commURL);
		map.put("boNum", boNum);

		return sqlsession.update("mapper.commboard.updateViewCnt",map);
		
	}
	
	@Override
	public String getCommName(String commURL) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.commboard.getCommName", commURL);
	}

	@Override
	public int like(String memNum, String boNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNum", memNum);
		map.put("boNum", boNum);
		return sqlsession.update("mapper.commboard.like",map);
	}
	
	@Override
	public int delLike(String memNum, String boNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNum", memNum);
		map.put("boNum", boNum);
		return sqlsession.update("mapper.commboard.delLike",map);
	}

	@Override
	public int updateLikeCnt(String memNum, String boNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNum", memNum);
		map.put("boNum", boNum);
		return sqlsession.update("mapper.commboard.updateLikeCnt",map);
	}
	
	@Override
	public int updatedisLikeCnt(String memNum, String boNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNum", memNum);
		map.put("boNum", boNum);
		return sqlsession.update("mapper.commboard.updatedelLikeCnt",map);
	}
	

	@Override
	public int likeCheck(String boNum, String memNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNum", memNum);
		map.put("boNum", boNum);
		return sqlsession.selectOne("mapper.commboard.likeCheck", map);
	}	
	
	@Override
	public int checkMem(String commURL, String memNum)  {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNum", memNum);
		map.put("commURL", commURL);
		System.out.println("map : "+map);
		return sqlsession.selectOne("mapper.commboard.checkMem", map);
	}	


}
