package com.rice.F001.F001service;



import java.util.List;
import java.util.Map;

import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.F001.F001vo.F001LectureVO;

public interface F001LectureService {
	
	public Map<String, Object> selectSubId(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> selectSubCode(F001LectureVO f001LectureVO);

	public void lectureAdd(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> selectSubInfo();

	public List<Map<String, Object>> selectLecturePlanInfo(F001LectureVO f001LectureVO);
	
	public String selectMemName(C001ClassBoardVO c001ClassBoardVO);

	public List<Map<String, Object>> lecturePlanInfoND(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> selectLecPlanId(F001LectureVO f001LectureVO);

	public String reGetTeaName(C001ClassBoardVO c001ClassBoardVO);

	public void insertOpenLec(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> classIdLec();

	public List<Map<String, Object>> bulCodeLec(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> selectTeaName(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> enrolmentInfo();

	public Map<String, Object> partnerOrderId();

	public void insertEnrolLec(Map<String, Object> insertEnrolLecS);

	public List<Map<String, Object>> searchClassIdName();

	public void holdDel(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> delRegL(F001LectureVO f001LectureVO);

	public List<Map<String, Object>> searchClassTea();

	public List<Map<String, Object>> getSubIdJspC(F001LectureVO f001LectureVO);

	public void insertCart(Map<String, Object> insertEnrolLecS);

	public void paidlist(String enrId);

	public void savePaidlist(Map<String, Object> insertEnrolLecS);

	public String searchSub(String tempId);

	public void insertOrderList(Map<String, Object> map);

	public List<Map<String, Object>> selectPaidListR(String memNum);

	public List<Map<String, Object>> cartInfo(String memNum);

}
