package com.rice.F001.F001dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.F001.F001vo.F001LectureVO;
import com.rice.F001.F001vo.F001VO;

@Repository
public class F001LectureDAOImpl implements F001LectureDAO{
	private static final Logger logger = LoggerFactory.getLogger(F001LectureDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;
	

	
	//select subId 
	@Override
	public Map<String, Object> selectSubId(F001LectureVO f001LectureVO) {
		logger.info("ok");
		Map<String, Object> subId = sqlsession.selectOne("mapper.f001Lecture.selectSubSeq", f001LectureVO);
		return subId;
	}



	@Override
	public List<Map<String, Object>> selectSubCode(F001LectureVO f001LectureVO) {
		logger.info("ok");
		List<Map<String, Object>> subCode = sqlsession.selectList("mapper.f001Lecture.selectSubCode", f001LectureVO);
		
		return subCode;
	}



	@Override
	public void lectureAdd(F001LectureVO f001LectureVO) {
		sqlsession.insert("mapper.f001Lecture.lectureAdd", f001LectureVO);
	}



	@Override
	public List<Map<String, Object>> selectSubInfo() {
		List<Map<String, Object>> selectSubInfo= sqlsession.selectList("mapper.f001Lecture.selectSubInfo");
		return selectSubInfo;
	}



	@Override
	public List<Map<String, Object>> selectLecturePlanInfo(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> selectLecturePlanInfo= sqlsession.selectList("mapper.f001Lecture.selectLecturePlanInfo",f001LectureVO);
		return selectLecturePlanInfo;
	}



	@Override
	public String selectMemName(C001ClassBoardVO c001ClassBoardVO) {
		String selectMemName= sqlsession.selectOne("mapper.f001Lecture.selectMemName",c001ClassBoardVO);
		return selectMemName;
	}



	@Override
	public List<Map<String, Object>> lecturePlanInfoND(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> lecturePlanInfoND= sqlsession.selectList("mapper.f001Lecture.lecturePlanInfoND",f001LectureVO);
		return lecturePlanInfoND;
	}



	@Override
	public List<Map<String, Object>> selectLecPlanId(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> selectLecPlanId= sqlsession.selectList("mapper.f001Lecture.selectLecPlanId",f001LectureVO);
		return selectLecPlanId;
	}



	@Override
	public String reGetTeaName(C001ClassBoardVO c001ClassBoardVO) {
		String reGetTeaName= sqlsession.selectOne("mapper.f001Lecture.reGetTeaName",c001ClassBoardVO);
		return reGetTeaName;
	}



	@Override
	public void insertOpenLec(F001LectureVO f001LectureVO) {
		sqlsession.insert("mapper.f001Lecture.insertOpenLec", f001LectureVO);
		
	}

}
