package com.rice.F001.F001dao;




import java.util.List;
import java.util.Map;

import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.F001.F001vo.F001LectureVO;

public interface F001LectureDAO {

	//subId 받아오기
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


}
