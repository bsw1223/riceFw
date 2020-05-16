package com.rice.F001.F001controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.F001.F001service.F001LectureService;
import com.rice.F001.F001vo.F001LectureVO;
import com.rice.common.AmountVO;
import com.rice.common.JsonUtil;
import com.rice.common.KakaoPayApprovalVO;

@Controller
@RequestMapping("/lectureMng/*")
public class F001LectureController {	// 회원관리
	private static final Logger logger = LoggerFactory.getLogger(F001LectureController.class);
	
	@Autowired
	private F001LectureService f001LectureService;
	@Autowired
	private F001LectureVO f001LectureVO;
		
//--------------------------------------------------강의 등록---------------------------------------------------------
	// 강의등록페이지로 이동
	@RequestMapping(value = "/lectureregist", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
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
	
	@RequestMapping(value = "listlectures", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
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
	@RequestMapping(value = "selectsubidname", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> selectSubIdName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectSubIdName = f001LectureService.selectSubInfo();
		//System.out.println("selectSubIdName : " + selectSubIdName);
		return selectSubIdName;
	}
	
	//강의 계획 데이터 읽어옴 select LecturePlanInfo
	@RequestMapping(value = "selectLecturePlanInfo", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
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
		//System.out.println("selectMemName : "+ selectMemName);
		return selectMemName;
	}
	
	//memNum으로 memName  다시가져옴
	@RequestMapping(value = "reGetTeaName", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String reGetTeaName(C001ClassBoardVO c001ClassBoardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reGetTeaName = f001LectureService.reGetTeaName(c001ClassBoardVO);
		//System.out.println("reGetTeaName  : "+reGetTeaName);
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
	
	
	//강의실자료 가져오기
	@RequestMapping(value = "classIdLec", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> classIdLec(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> classIdLec=f001LectureService.classIdLec();
		//System.out.println("controller_ classIdLec : "+ classIdLec.toString());
		return classIdLec;
	}

	//강의실자료 가져오기2
	@RequestMapping(value = "bulCodeLec", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> bulCodeLec(F001LectureVO f001LectureVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> bulCodeLec=f001LectureService.bulCodeLec(f001LectureVO);
		//System.out.println("controller_ bulCodeLec : "+ bulCodeLec.toString());
		return bulCodeLec;
	}
	
	//강사 검색
	@RequestMapping(value = "selectTeaName", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> selectTeaName(F001LectureVO f001LectureVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectTeaName=f001LectureService.selectTeaName(f001LectureVO);
		//System.out.println("controller_ bulCodeLec : "+ selectTeaName.toString());
		return selectTeaName;
	}
	//--------------------------------------------------------------------결제 ----------------------------------------------------------------
	@RequestMapping(value = "enrolment", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	public String enrolment(){
		//System.out.println("controller_ bulCodeLec : "+ selectTeaName.toString());
		return "F_Enrolment";
	}
	
	//수강신청 정보 불러오기
	@RequestMapping(value = "enrolmentInfo", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> enrolmentInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> enrolmentInfo=f001LectureService.enrolmentInfo();
		//System.out.println("controller_ enrolmentInfo : "+ enrolmentInfo.toString());
		return enrolmentInfo;
	}
	//결제번호 
	@RequestMapping(value = "partnerOrderId", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> partnerOrderId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> partnerOrderId=f001LectureService.partnerOrderId();
		//System.out.println("controller_ partnerOrderId : "+ partnerOrderId.toString());
		return partnerOrderId;
	}
	//검색 과목명 & id
	@RequestMapping(value = "searchClassIdName", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> searchClassIdName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> searchClassIdName=f001LectureService.searchClassIdName();
		//System.out.println("controller_ searchClassIdName : "+ searchClassIdName.toString());
		return searchClassIdName;
	}
	//검색 강사명
	@RequestMapping(value = "searchClassTea", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> searchClassTea(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> searchClassTea = f001LectureService.searchClassTea();
		//System.out.println("controller_ searchClassTea : "+ searchClassTea.toString());
		return searchClassTea;
	}
	

	//보류중리스트 삭제
	@RequestMapping(value = "holdDel", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void holdDel(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		f001LectureService.holdDel(f001LectureVO);
		//System.out.println("controller_ searchClassIdName : "+ searchClassIdName.toString());
		return;
	}
	
	
	//듣는과목 리스트 불러오기 
	@RequestMapping(value = "delRegL", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> delRegL(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> delRegL = f001LectureService.delRegL(f001LectureVO);
		//System.out.println("controller_ delRegL : "+ delRegL.toString());
		return delRegL;
	}
	//듣는과목 리스트 불러오기 
	@RequestMapping(value = "getSubIdJspC", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> getSubIdJspC(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> getSubIdJspC = f001LectureService.getSubIdJspC(f001LectureVO);
		//System.out.println("controller_ getSubIdJspC : "+ getSubIdJspC.toString());
		return getSubIdJspC;
	}
	
	
	//장바구니
	@RequestMapping(value = "insertCart", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void insertCart(@RequestBody Map<String,Object> insertEnrolLecS, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("insertEnrolLecS : "+insertEnrolLecS);
		f001LectureService.insertCart(insertEnrolLecS);
		return;
		
	}
	
	//결제완료 확인 후 세션정보 저장
	@RequestMapping(value = "paid", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void paidlist(@RequestBody Map<String,Object> insertEnrolLecS, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//System.out.println("insertEnrolLecS : "+insertEnrolLecS);
		//{approveTime=Fri May 08 01:59:41 KST 2020, orderId=714, itemName= lc 완전정복 외1건, amountTotal=300000, paidMode=1600}
		//시간에 3시간 더해서 넣기
		
			String paidLDate = (String) insertEnrolLecS.get("approveTime");
			//System.out.println(paidLDate);
			//날짜 포멧 변경
			DateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss", Locale.KOREA);
			Date date = dateFormat.parse(paidLDate);//파라미터로 지금형식 넣는다.
			//System.out.println("date1 : "+date);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.HOUR, 3);//시간더하기, 변경 안됨
			
			//System.out.println("date2 : "+date);
			
			String afterDate = sdf.format(date); 
			//System.out.println("afterDate : "+afterDate);
			
			insertEnrolLecS.put("approveTime",afterDate);
			//System.out.println("insertEnrolLecS :"+insertEnrolLecS);
	
		
		f001LectureService.savePaidlist(insertEnrolLecS);//결제정보 저장
		
		Map<String,Object> map = new HashMap<String,Object>();//결제 내역에 저장할 map
		
		String orderId = (String) insertEnrolLecS.get("orderId");//멤버넘버
		String memNum = (String) insertEnrolLecS.get("memNum");//멤버넘버
		HttpSession session = request.getSession(false);
	    ArrayList sessionClassIdList = new ArrayList();
	    sessionClassIdList.add(session.getAttribute("classIdList"));//세션값을 배열에 넣는다.
	   
	    //세션 값 받아 memnum과 openclassid 합쳐 검색 후 classApplycode를 1600으로 변경한다.
	    ArrayList tempIdO = new ArrayList();
	    ArrayList tempIdO2 = new ArrayList();
	    ArrayList mapperList = new ArrayList();
	    String enrId = null;
	    for(int i =0; i<sessionClassIdList.size();i++) {
	    	//System.out.println("sessionClassIdList :"+sessionClassIdList);
	    	//ArrayList tempIdO3 = new ArrayList();
	    	tempIdO.add(sessionClassIdList.get(i));//리스트로 들어감
	    	tempIdO2 = (ArrayList) tempIdO.get(i);
	    	//System.out.println("tempIdO2 : "+tempIdO2);
	    }
	    
	    for(int i =0; i<tempIdO2.size();i++) {
	    	String tempIdO3 =tempIdO2.get(i).toString();
//	    	System.out.println("tempIdO3 : "+tempIdO3);
	    	
	    	String tempId =  tempIdO3.toString();//세션에 저장된 아이디를 저장한다.과목id임 이것 이용해서 과목정보 가져옴
//	    	System.out.println("tempId : "+tempId);
//	    	System.out.println(memNum);
	    	enrId = tempId+memNum;
//	    	System.out.println("enrId :"+enrId);
	    	
	    	f001LectureService.paidlist(enrId);//수강신청 상태 1600으로 변경
	    	//결제 세부내역 id로 검색하여 결과 가져오기, 가져와서 db에 저장, list<map>으로 
	    	String searchSub = f001LectureService.searchSub(tempId);//과목정보 검색한다.
//	    	System.out.println("searchSub :"+searchSub);
	    	//결제 내역에 과목 id, 가격, 결제번호 넣기
	    	map.put("tempId",tempId);
	    	map.put("classPrice",searchSub);
	    	map.put("orderId",orderId);
//	    	System.out.println("map : "+map);	  
	    	f001LectureService.insertOrderList(map);//과목정보 검색한다.
	    }
	   	    
	    session.setAttribute("classIdList", "");//classIdList세션 초기화
		return;
	}
	
	@RequestMapping(value = "paidlist", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	public String paid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "F_PaidList";
	}
	@RequestMapping(value = "cart", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	public String cart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "F_Cart";
	}
	
	@RequestMapping(value = "cartInfo", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> cartInfo(@RequestBody String memNum, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("memNum : "+ memNum);
		List<Map<String, Object>> cartInfo = f001LectureService.cartInfo(memNum);
		//System.out.println("controller_ cartInfo : "+ cartInfo);
		//System.out.println("cartInfo : "+cartInfo);
		return cartInfo;
	}
	@RequestMapping(value = "delCartList", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void delCartList(@RequestBody Map<String,Object> memNum, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("memNum : "+ memNum);
		f001LectureService.delCartList(memNum);
		//System.out.println("controller_ delCartList : "+ delCartList);
		return;
	}
	@RequestMapping(value = "wholeDelButton", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void wholeDelButton(@RequestBody Map<String,Object> memNum, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("memNum : "+ memNum);
		f001LectureService.wholeDelButton(memNum);
		//System.out.println("controller_ wholeDelButton : "+ wholeDelButton);
		return;
	}
	@RequestMapping(value = "selectDelButton", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void selectDelButton(@RequestBody Map<String,Object> memNum, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("memNum : "+ memNum);
		f001LectureService.selectDelButton(memNum);
		//System.out.println("controller_ selectDelButton : "+ selectDelButton);
		return;
	}
	
	@RequestMapping(value = "paidList", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> paidList(@RequestBody Map<String,Object> memNum, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("memNum : "+ memNum);
		List<Map<String, Object>> paidList = f001LectureService.paidList(memNum);
		//System.out.println("controller_ paidList : "+ paidList);
		return paidList;
	}
	
	@RequestMapping(value = "paidListDetail", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> paidListDetail(@RequestBody Map<String,Object> DetailCart, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("DetailCart : "+ DetailCart);
		List<Map<String, Object>> paidListDetail = f001LectureService.paidListDetail(DetailCart);
		//System.out.println("controller_ paidListDetail : "+ paidListDetail);
		return paidListDetail;
	}
	
	@RequestMapping(value = "selectBulCl", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> selectBulCl(@RequestBody Map<String,Object> DetailCart, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("DetailCart : "+ DetailCart);
		Map<String, Object> selectBulCl = f001LectureService.selectBulCl(DetailCart);
		//System.out.println("controller_ selectBulCl : "+ selectBulCl);
		
		
		return selectBulCl;
	}
	
	
	@RequestMapping(value = "searchOpenClT", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> searchOpenClT(@RequestBody Map<String,Object> DetailCart, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("DetailCart : "+ DetailCart);
		List<Map<String, Object>> searchOpenClT = f001LectureService.searchOpenClT(DetailCart);
//		System.out.println("controller_ searchOpenClT : "+ searchOpenClT);
		return searchOpenClT;
	}
	@RequestMapping(value = "selectCountCapa", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> selectCountCapa(@RequestBody Map<String,Object> DetailCart, F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("selectCountCapa : "+ DetailCart);
		Map<String, Object> selectCountCapa = f001LectureService.selectCountCapa(DetailCart);
		//System.out.println("controller_ selectCountCapa : "+ selectCountCapa);
		
		
		return selectCountCapa;
	}
	@RequestMapping(value = "readyLecturePlanAdd", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> readyLecturePlanAdd( F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> lecCodeVal = f001LectureService.lecCodeVal();
		return lecCodeVal;
	}
	
	@RequestMapping(value = "appformteacher", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	public String appformteacher(ModelAndView modelAndView , HttpServletRequest request, HttpServletResponse response) {
		return "F_LecturePlanAdd";
	}
	
	@RequestMapping(value = "lecturePlanAdd", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public void lecturePlanAdd(@RequestBody Map<String,Object> memNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("memNum : "+ memNum);
		f001LectureService.lecturePlanAdd(memNum);
		//System.out.println("controller_ selectDelButton : "+ selectDelButton);
		return;
	}	
	
	//수강신청 카운트 가져오기
	@RequestMapping(value = "selectCountSub", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> selectCountSub(F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> selectCountSub = f001LectureService.selectCountSub(f001LectureVO);
		//System.out.println("selectCountSub"+selectCountSub);
		return selectCountSub;
	}
	@RequestMapping(value = "selectRecomendInfo", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> selectRecomendInfo(@RequestBody Map<String,Object> memNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("memNum : "+ memNum);
		Map<String, Object> selectRecomendInfo =f001LectureService.selectRecomendInfo(memNum);
		//System.out.println("controller_ selectRecomendInfo : "+ selectRecomendInfo);
		return selectRecomendInfo;
	}	
	@RequestMapping(value = "selectClassCapa", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> selectClassCapa(@RequestBody Map<String,Object> memNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("CONTROLLER"+memNum);
		List<Map<String, Object>> selectClassCapa = f001LectureService.selectClassCapa(memNum);
		//System.out.println("selectClassCapa"+selectClassCapa);
		return selectClassCapa;
	}
}
