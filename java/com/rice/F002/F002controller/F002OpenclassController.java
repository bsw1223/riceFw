package com.rice.F002.F002controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.F002.F002service.F002OpenclassService;
import com.rice.F002.F002vo.F002OpenclassVO;

@Controller
@RequestMapping("/openMng/*")
public class F002OpenclassController {
	private static final Logger logger = LoggerFactory.getLogger(F002OpenclassController.class);
	
	@Autowired
	private F002OpenclassService f002OpenclassService;
	
	// 기본 화면 , 개설교과과정 조회
	@RequestMapping(value = "/openclassadmin", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /openMng/openclassadmin init");
		request.setCharacterEncoding("UTF-8");
		return "F_OpenclassList";
	}
	
	// 검색 조회
	@RequestMapping(value = "/openclassadmin/search", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map searchList(@RequestParam(value="className", required=false) String className, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /openMng/openclassadmin/search");
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();	// 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 조회결과
		
		// 검색조건 설정
		searchMap.put("className", className);

		// 데이터 조회
		List<F002OpenclassVO> data = f002OpenclassService.searchList(searchMap);
		logger.info(data.toString());
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/openclassadmin/save", method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf8")
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /openMng/openclassadmin/save");
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
			f002OpenclassService.saveData(dataMap);
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
