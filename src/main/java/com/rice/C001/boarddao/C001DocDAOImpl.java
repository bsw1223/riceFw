
package com.rice.C001.boarddao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
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
	public int getTotal() {
		// TODO Auto-generated method stub
		int page;
		page = sqlsession.selectOne("mapper.myboard.getTotal");
		return page;
	}

	@Override
	public C001ClassBoardVO read(String boNum) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.myboard.read", boNum);
	}

}
