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
		//logger.info("ok");
		Map<String, Object> subId = sqlsession.selectOne("mapper.f001Lecture.selectSubSeq", f001LectureVO);
		return subId;
	}



	@Override
	public List<Map<String, Object>> selectSubCode(F001LectureVO f001LectureVO) {
		//logger.info("ok");
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



	@Override
	public List<Map<String, Object>> classIdLec() {
		List<Map<String, Object>> classIdLec= sqlsession.selectList("mapper.f001Lecture.classIdLec");
		return classIdLec;
	}

	@Override
	public List<Map<String, Object>> bulCodeLec(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> bulCodeLec= sqlsession.selectList("mapper.f001Lecture.bulCodeLec",f001LectureVO);
		return bulCodeLec;
	}



	@Override
	public List<Map<String, Object>> selectTeaName(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> selectTeaName= sqlsession.selectList("mapper.f001Lecture.selectTeaName",f001LectureVO);
		return selectTeaName;
	}



	@Override
	public List<Map<String, Object>> enrolmentInfo() {
		List<Map<String, Object>> enrolmentInfo= sqlsession.selectList("mapper.f001Lecture.enrolmentInfo");
		return enrolmentInfo;
	}



	@Override
	public Map<String, Object> partnerOrderId() {
		Map<String, Object> partnerOrderId= sqlsession.selectOne("mapper.f001Lecture.partnerOrderId");
		return partnerOrderId;
	}



	@Override
	public void insertEnrolLec(Map<String, Object> insertEnrolLecS) {
//		System.out.println("Dao : "+insertEnrolLecS);
	sqlsession.insert("mapper.f001Lecture.insertEnrolLec", insertEnrolLecS);
		
	}



	@Override
	public List<Map<String, Object>> searchClassIdName() {
		List<Map<String, Object>> searchClassIdName= sqlsession.selectList("mapper.f001Lecture.searchClassIdName");
		return searchClassIdName;
	}



	@Override
	public void holdDel(F001LectureVO f001LectureVO) {
		sqlsession.delete("mapper.f001Lecture.holdDel",f001LectureVO);
		return;
	}



	@Override
	public List<Map<String, Object>> delRegL(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> delRegL= sqlsession.selectList("mapper.f001Lecture.delRegL",f001LectureVO);
		return delRegL;
	}



	@Override
	public List<Map<String, Object>> searchClassTea() {
		List<Map<String, Object>> searchClassTea= sqlsession.selectList("mapper.f001Lecture.searchClassTea");
		return searchClassTea;
	}



	@Override
	public List<Map<String, Object>> getSubIdJspC(F001LectureVO f001LectureVO) {
		List<Map<String, Object>> getSubIdJspC= sqlsession.selectList("mapper.f001Lecture.getSubIdJspC",f001LectureVO);
		return getSubIdJspC;
	}



	@Override
	public void insertCart(Map<String, Object> insertEnrolLecS) {
		sqlsession.insert("mapper.f001Lecture.insertCart",insertEnrolLecS);
//		System.out.println("dao insertEnrolLecS : " +insertEnrolLecS);

		return;
	}



	@Override
	public void paidlist(String enrId) {
		sqlsession.update("mapper.f001Lecture.paidlist",enrId);
		
	}



	@Override
	public void savePaidlist(Map<String, Object> insertEnrolLecS) {
		sqlsession.insert("mapper.f001Lecture.savePaidlist",insertEnrolLecS);
		
	}



	@Override
	public String searchSub(String tempId) {
		String searchSub = sqlsession.selectOne("mapper.f001Lecture.searchSub",tempId);
		return searchSub;
	}



	@Override
	public void insertOrderList(Map<String, Object> map) {
		sqlsession.insert("mapper.f001Lecture.insertOrderList",map);
		
	}



	@Override
	public List<Map<String, Object>> selectPaidListR(Map<String, Object> memNum) {
		List<Map<String, Object>> selectPaidListR= sqlsession.selectList("mapper.f001Lecture.selectPaidListR",memNum);
//		System.out.println("dao selectPaidListR : " + selectPaidListR);
		return selectPaidListR;
	}



	@Override
	public List<Map<String, Object>> cartInfo(String memNum) {
		List<Map<String, Object>> cartInfo= sqlsession.selectList("mapper.f001Lecture.cartInfo",memNum);
		return cartInfo;
	}



	@Override
	public void delCartList(Map<String, Object> memNum) {
		sqlsession.delete("mapper.f001Lecture.delCartList",memNum);
		
	}



	@Override
	public void wholeDelButton(Map<String, Object> memNum) {
		sqlsession.delete("mapper.f001Lecture.wholeDelButton",memNum);
		
	}



	@Override
	public void selectDelButton(Map<String, Object> memNum) {
		sqlsession.delete("mapper.f001Lecture.selectDelButton",memNum);
		
	}



	@Override
	public List<Map<String, Object>> paidList(Map<String, Object> memNum) {
		List<Map<String, Object>> paidList= sqlsession.selectList("mapper.f001Lecture.paidList",memNum);
		return paidList;
	}



	@Override
	public List<Map<String, Object>> paidListDetail(Map<String, Object> detailCart) {
		List<Map<String, Object>> paidListDetail= sqlsession.selectList("mapper.f001Lecture.paidListDetail",detailCart);
		//System.out.println("dao_ paidListDetail : "+ paidListDetail);
		return paidListDetail;
	}



	@Override
	public Map<String, Object> selectBulCl(Map<String, Object> detailCart) {
		Map<String, Object> selectBulCl= (Map<String, Object>) sqlsession.selectOne("mapper.f001Lecture.selectBulCl",detailCart);
		return selectBulCl;
	}



	@Override
	public List<Map<String, Object>> searchOpenClT(Map<String, Object> detailCart) {
		List<Map<String, Object>> searchOpenClT= sqlsession.selectList("mapper.f001Lecture.searchOpenClT",detailCart);
//		System.out.println("dao_ searchOpenClT : "+ searchOpenClT);
		return searchOpenClT;
	}



	@Override
	public Map<String, Object> selectCountCapa(Map<String, Object> detailCart) {
		Map<String, Object> selectCountCapa= (Map<String, Object>) sqlsession.selectOne("mapper.f001Lecture.selectCountCapa",detailCart);
		return selectCountCapa;
	}



	@Override
	public List<Map<String, Object>> lecCodeVal() {
		List<Map<String, Object>> lecCodeVal= sqlsession.selectList("mapper.f001Lecture.lecCodeVal");
		return lecCodeVal;
	}



	@Override
	public void lecturePlanAdd(Map<String, Object> memNum) {
		System.out.println("dao memNum:" +memNum);
		sqlsession.insert("mapper.f001Lecture.lecturePlanAdd",memNum);
		
	}



	@Override
	public List<Map<String, Object>> selectCountSub() {
		List<Map<String, Object>> selectCountSub= sqlsession.selectList("mapper.f001Lecture.selectCountSub");
		return selectCountSub;
	}



	@Override
	public Map<String, Object> selectRecomendInfo(Map<String, Object> memNum) {
		Map<String, Object> selectRecomendInfo= (Map<String, Object>) sqlsession.selectOne("mapper.f001Lecture.selectRecomendInfo",memNum);
		return selectRecomendInfo;
	}



	@Override
	public List<Map<String, Object>> selectClassCapa(Map<String, Object> memNum) {
		List<Map<String, Object>> selectClassCapa= sqlsession.selectList("mapper.f001Lecture.selectClassCapa",memNum);
		return selectClassCapa;
	}
}
