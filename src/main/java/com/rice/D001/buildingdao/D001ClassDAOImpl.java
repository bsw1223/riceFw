package com.rice.D001.buildingdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001ClassVO;


@Repository
public class D001ClassDAOImpl implements D001ClassDAO{
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<D001ClassVO> getListWithPaging(Criteria cri) {

		return sqlsession.selectList("mapper.class.getListWithPaging", cri);
	}

	@Override
	public int getTotal() {

		int page;
		page = sqlsession.selectOne("mapper.class.getTotal");

		return page;
	}

	@Override
	public D001ClassVO read(String classId) {

		return sqlsession.selectOne("mapper.class.read", classId);
	}

	@Override
	public int delete(String classId) {

		return sqlsession.delete("mapper.class.delete", classId);
	}

	@Override
	public int update(D001ClassVO vo) {

		return sqlsession.update("mapper.class.update", vo);
	}
}
