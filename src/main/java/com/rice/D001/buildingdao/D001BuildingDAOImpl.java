package com.rice.D001.buildingdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001BuildingVO;

@Repository
public class D001BuildingDAOImpl implements D001BuildingDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<D001BuildingVO> getListWithPaging(Criteria cri) {

		return sqlsession.selectList("mapper.building.getListWithPaging", cri);
	}

	@Override
	public int getTotal() {

		int page;
		page = sqlsession.selectOne("mapper.building.getTotal");

		return page;
	}

	@Override
	public D001BuildingVO read(String bulId) {

		return sqlsession.selectOne("mapper.building.read", bulId);
	}

	@Override
	public int delete(String bulId) {

		return sqlsession.delete("mapper.building.delete", bulId);
	}

	@Override
	public int update(D001BuildingVO vo) {

		return sqlsession.update("mapper.building.update", vo);
	}
	
	//----------------------------------------------------

	
	@Override
	public List<Map<String, Object>> getInfo(String bulId) {

		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getBuildInfo",bulId);
		return list;
		
	}


	@Override
	public List<Map<String, Object>> getInfoBUL() {
		List<Map<String, Object>> list = null;
		list= sqlsession.selectList("mapper.Build.getBULInfo");
		return list;
	}



	
	

}
