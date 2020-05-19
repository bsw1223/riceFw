package com.rice.C001.boarddao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001CommentVO;
import com.rice.C001.replyvo.C001ReplyVO;

@Repository
public class C001ComtDAOImpl implements C001ComtDAO {

	@Autowired
	private SqlSession sqlsession;

	public int insert(C001CommentVO vo) {
		return sqlsession.insert("mapper.classcomment.insert", vo);
	}

	public C001CommentVO read(String boNum) {

		C001CommentVO list = null;

		list = sqlsession.selectOne("mapper.classcomment.read", boNum);

		return list;
	}

	public int delete(String comtNum) {
		return sqlsession.delete("mapper.classcomment.delete", comtNum);
	}

	public int update(C001CommentVO vo) {
		return sqlsession.update("mapper.classcomment.update", vo);
	}

	public List<C001CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("boNum") String boNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("boNum", boNum);

		return sqlsession.selectList("mapper.classcomment.getListWithPaging", map);
	}
}
