package com.rice.C001.boarddao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.replyvo.C001ReplyVO;



@Repository
public class C001ReplyDAOImpl implements C001ReplyDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insert(C001ReplyVO vo) {
		return sqlsession.insert("mapper.reply.insert",vo);
	}
	
	public C001ReplyVO read(Long bno) {
		
		C001ReplyVO list = null;

		list = sqlsession.selectOne("mapper.reply.read",bno);

		return list;
	}
	
	public int delete(Long rno) {
		return sqlsession.delete("mapper.reply.delete", rno);
	}
	
	public int update(C001ReplyVO vo) {
		return sqlsession.update("mapper.reply.update", vo);
	}
	
	public List<C001ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "cri", cri);
		map.put( "bno", bno);
		
		return sqlsession.selectList("mapper.reply.getListWithPaging",map);
	}
}
