
package com.rice.E001.commdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.rice.E001.commvo.E001FileUploadVO;

@Repository
public class E001FileDAOImpl implements E001FileDAO {

	@Autowired
	private SqlSession sqlsession;


	@Override
	public void insert(E001FileUploadVO vo) {
		sqlsession.insert("mapper.upload.insert", vo);
	}

	@Override
	public void delete(String boNum) {
		sqlsession.delete("mapper.upload.delete", boNum);
	}

	@Override
	public List<E001FileUploadVO> findByboNum(String boNum) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.upload.findByboNum", boNum);
	}

}
