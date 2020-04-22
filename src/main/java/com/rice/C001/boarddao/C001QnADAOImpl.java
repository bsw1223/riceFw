package com.rice.C001.boarddao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.qnavo.C001QnAVO;


@Repository
public class C001QnADAOImpl implements C001QnADAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void insert(C001QnAVO vo) {
		
		sqlsession.insert("mapper.qna.insert",vo);
	}

	@Override
	public List<C001QnAVO> listAll() {

		return sqlsession.selectList("mapper.qna.list");
	}


	@Override
	public void delete(String boNum) {

		sqlsession.delete("mapper.qna.delete",boNum);
	}

	@Override
	public void modify(C001QnAVO vo) {
		sqlsession.update("mapper.qna.modify",vo);

	}

	@Override
	public C001QnAVO read(String boNum) {

		return sqlsession.selectOne("mapper.qna.BoardDetail",boNum);
	}

	/*
	 * @Override public void insertSelectKey(C001QnAVO vo) {
	 * 
	 * sqlsession.insert("mapper.qna.insertSelectKey",vo); }
	 */

	@Override
	public List<C001QnAVO> getListWithPaging(Criteria cri) {

		return sqlsession.selectList("mapper.qna.getListWithPaging", cri);
	}

	@Override
	public int getTotal() {
		
		return sqlsession.selectOne("mapper.qna.getTotal");
				
	}

	@Override
	public void insertFile(Map<String, Object> map) {

		sqlsession.insert("mapper.qna.insertFile",map);
	}

	@Override
	public List<Map<String, Object>> selectFileList(String boNum) throws Exception {
		return sqlsession.selectList("mapper.qna.selectFileList",boNum);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		
		return sqlsession.selectOne("mapper.qna.selectFileInfo",map);
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {

		sqlsession.update("mapper.qna.updateFile",map);
	}
}
