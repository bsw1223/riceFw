package com.rice.F001.F001controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.F001.F001service.F001LectureService;
import com.rice.F001.F001vo.F001LectureVO;

@Controller
@RequestMapping("/lectureMng/*")
public class F001LectureController {	// 회원관리
	private static final Logger logger = LoggerFactory.getLogger(F001LectureController.class);
	
	@Autowired
	private F001LectureService f001LectureService;
	//@Autowired
	//private F001LectureVO f001LectureVO;
		
//--------------------------------------------------강의 등록---------------------------------------------------------
	// 강의등록페이지로 이동
	@RequestMapping(value = "/lectureregist", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		return "F_LectureAdd";
	}
	
	//select SubId, subId가져오기
	@RequestMapping(value = "selectSubId", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> selectSubId(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> subId = null;
		subId = f001LectureService.selectSubId(f001LectureVO);
		return subId;
	}
	
	//select SubCode, SubCode가져오기
	@RequestMapping(value = "selectSubCode", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> selectSubCode(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		List<Map<String, Object>> subCode = null;
		subCode = f001LectureService.selectSubCode(f001LectureVO);
		return subCode;
	}
	
	//select SubCode, SubCode가져오기
	@RequestMapping(value = "lectureadd", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void lectureAdd(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		f001LectureService.lectureAdd(f001LectureVO);
	}
//--------------------------------------------------강의list---------------------------------------------------------
	
	@RequestMapping(value = "listlectures", method= {RequestMethod.GET, RequestMethod.POST})
	public String listlectures(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectSubInfo = f001LectureService.selectSubInfo();
		model.addAttribute("listB",selectSubInfo);
		return "F_LectureList";
	}
//--------------------------------------------------개설교과과정 추가---------------------------------------------------------
	//jsp띄우기
//	@RequestMapping(value = "openclassadd", method= {RequestMethod.GET, RequestMethod.POST})
//	public String openClassAdd(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
//		return "F_openClassAdd";
//	}
	
	//subject에서 subid와 subname가져옴, id는 value로 넣는다.
	@RequestMapping(value = "selectsubidname", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> selectSubIdName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectSubIdName = f001LectureService.selectSubInfo();
		//System.out.println("selectSubIdName : " + selectSubIdName);
		return selectSubIdName;
	}
	
	//강의 계획 데이터 읽어옴 select LecturePlanInfo
	@RequestMapping(value = "selectLecturePlanInfo", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> selectLecturePlanInfo(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectLecturePlanInfo = f001LectureService.selectLecturePlanInfo(f001LectureVO);
		return selectLecturePlanInfo;
	}
	
	//memNum으로 memName 가져옴
	@RequestMapping(value = "selectMemName", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectMemName(C001ClassBoardVO c001ClassBoardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String selectMemName = f001LectureService.selectMemName(c001ClassBoardVO);
		return selectMemName;
	}
	
	//memNum으로 memName  다시가져옴
	@RequestMapping(value = "reGetTeaName", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String reGetTeaName(C001ClassBoardVO c001ClassBoardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reGetTeaName = f001LectureService.reGetTeaName(c001ClassBoardVO);
		return reGetTeaName;
	}
	
	
	
	
//-------------------------------------------------------------강의계획 가져오기---------------------------------------------------------------	
	//memNum,subCode로 강의계획 정보 가져오기, 강의 계획명, 강의 설명 사용
	@RequestMapping(value = "lecturePlanInfoND", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> lecturePlanInfoND(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		 List<Map<String, Object>> lecturePlanInfoND = f001LectureService.lecturePlanInfoND(f001LectureVO);
		//System.out.println("controller_ lecturePlanInfoND : "+ lecturePlanInfoND);
		return lecturePlanInfoND;
	}
	
	
	//planId로 lecture 정보 가져오기 
	@RequestMapping(value = "selectLecPlanId", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> selectLecPlanId(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectLecPlanId = f001LectureService.selectLecPlanId(f001LectureVO);
		//System.out.println("controller_ selectLecPlanId : "+ selectLecPlanId);
		return selectLecPlanId;
	}

	
	//planId로 lecture 정보 가져오기 
	@RequestMapping(value = "insertOpenLec", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void insertOpenLec(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		f001LectureService.insertOpenLec(f001LectureVO);
//		System.out.println("controller_ insertOpenLec : "+ f001LectureVO.toString());
	}
	
}
