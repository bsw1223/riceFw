package com.rice.D001.buildingdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C001.boarddto.Criteria;
import com.rice.D001.buildingvo.D001BuildingVO;
import com.rice.D001.buildingvo.D001ClassVO;

@Repository
public class D001ClassDAOImpl implements D001ClassDAO {
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
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------------------------------------------------
	//강의실등록에서  건물이름 받아오기 
		@Override
		public List<Map<String, Object>> getBulName() {
			List<Map<String, Object>> list = null;
			list= sqlsession.selectList("mapper.Build.getBuildName");
			return list;
		}
		
		//강의실 등록에서 등록하기
		@Override
		public void insertClR(D001BuildingVO d001BuildingVO) {
			sqlsession.selectList("mapper.Build.insertClRInfo",d001BuildingVO);
			String getBulId = d001BuildingVO.getBulId();
				
		}

		

		//강의실정보
		@Override
		public List<Map<String, Object>> getInfoClass(String classId) {
					
			List<Map<String, Object>> list = null;
			list= sqlsession.selectList("mapper.Build.getClassInfo",classId);
			return list;
		}
		
		
		//강의실등록에서 강의실정보 불러오기
		@Override
		public List<Map<String, Object>> getInfoClR() {
			List<Map<String, Object>> list = null;
			list= sqlsession.selectList("mapper.Build.getClRInfo");
			return list;
		}
		
		
		//강의실 등록
		@Override
		public void insertBuilding(D001BuildingVO d001BuildingVO) {
			sqlsession.selectList("mapper.Build.insertBuildingInfo",d001BuildingVO);
			
		}
		
	
	
	
	
	
	
	
	
	
	
}
