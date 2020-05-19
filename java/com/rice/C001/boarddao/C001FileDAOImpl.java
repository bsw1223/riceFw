
package com.rice.C001.boarddao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.C001.boardvo.C001FileUploadVO;

@Repository
public class C001FileDAOImpl implements C001FileDAO {

	@Autowired
	private SqlSession sqlsession;


	@Override
	public void insert(C001FileUploadVO vo) {
		sqlsession.insert("mapper.upload.insert", vo);
	}

	@Override
	public void delete(String boNum) {
		sqlsession.delete("mapper.upload.delete", boNum);
	}

	@Override
	public List<C001FileUploadVO> findByboNum(String boNum) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.upload.findByboNum", boNum);
	}

}
