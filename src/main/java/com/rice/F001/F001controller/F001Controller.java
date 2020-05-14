package com.rice.F001.F001controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.F001.F001service.F001Service;
import com.rice.F001.F001vo.F001VO;

@Controller
@RequestMapping("/memMng/*")
public class F001Controller {	// 회원관리
	private static final Logger logger = LoggerFactory.getLogger(F001Controller.class);
	
	@Autowired
	private F001Service f001Service;
	@Autowired
	private F001VO f001VO;
		
	// 기본 화면 , 학생 조회
	@RequestMapping(value = "/stMngadmin", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("/memMng/stMngadmin init");
		request.setCharacterEncoding("UTF-8");
		return "F_001Board";
	}
	
	// 기본 화면 , 강사 조회
	@RequestMapping(value = "/tchMngadmin", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchInit2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("/memMng/stMngadmin init");
		request.setCharacterEncoding("UTF-8");
		return "F_002Board";
	}
	
	// 기본 화면 , 관리자 조회
	@RequestMapping(value = "/adminMngadmin", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchInit3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("/memMng/adminMngadmin init");
		request.setCharacterEncoding("UTF-8");
		return "F_003Board";
	}
	
	// 검색 조회
	@RequestMapping(value = "/stMngadmin/search", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map searchStuList(@RequestParam(value="memId", required=false) String memName, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get/post  stMngadmin/search");
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();	// 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 조회결과
		
		// 검색조건 설정
		searchMap.put("authId", "1001");
		searchMap.put("memName", memName);

		// 데이터 조회
		List<F001VO> data = f001Service.searchList(searchMap);
		logger.info(data.toString());
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	// 검색 조회
	@RequestMapping(value = "/tchMngadmin/search", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map searchTeaList(@RequestParam(value="memId", required=false) String memName, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get/post  stMngadmin/search");
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();	// 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 조회결과
		
		// 검색조건 설정
		searchMap.put("authId", "1002");
		searchMap.put("memName", memName);

		// 데이터 조회
		List<F001VO> data = f001Service.searchList(searchMap);
		logger.info(data.toString());
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	// 검색 조회
	@RequestMapping(value = "/adminMngadmin/search", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map searchAdminList(@RequestParam(value="memId", required=false) String memName, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get/post  adminMngadmin/search");
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();	// 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 조회결과
		
		// 검색조건 설정
		searchMap.put("authId", "1000");
		searchMap.put("memName", memName);

		// 데이터 조회
		List<F001VO> data = f001Service.searchList(searchMap);
		logger.info(data.toString());
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/stMngadmin/save", method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf8")
	@ResponseBody
	public Map saveStuData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();	// 저장할 Data
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 처리결과
		
		// 저장 data 추출하기
		Enumeration enu = request.getParameterNames();
		while( enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String [] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			f001Service.saveData(dataMap);
			result.put("Code", "0");
			result.put("Message", "저장되었습니다");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/tchMngadmin/save" , method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf8")
	@ResponseBody
	public Map saveTeaData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();	// 저장할 Data
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 처리결과
		
		// 저장 data 추출하기
		Enumeration enu = request.getParameterNames();
		while( enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String [] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			f001Service.saveData(dataMap);
			result.put("Code", "0");
			result.put("Message", "저장되었습니다");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/adminMngadmin/save" , method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf8")
	@ResponseBody
	public Map saveAdminData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();	// 저장할 Data
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 처리결과
		
		// 저장 data 추출하기
		Enumeration enu = request.getParameterNames();
		while( enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String [] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			f001Service.saveData(dataMap);
			result.put("Code", "0");
			result.put("Message", "저장되었습니다");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);
		return resultMap;
	}
}
