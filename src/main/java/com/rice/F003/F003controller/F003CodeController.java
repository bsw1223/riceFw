package com.rice.F003.F003controller;

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

import com.rice.F003.F003service.F003CodeService;
import com.rice.F003.F003vo.F003CodeVO;
import com.rice.F003.F003vo.F003CodegroupVO;

@Controller
@RequestMapping("/codeMng/*")
public class F003CodeController {
	private static final Logger logger = LoggerFactory.getLogger(F003CodeController.class);
	
	@Autowired
	private F003CodeService f003CodeService;
	
	// 기본 화면 , 코드그룹 조회
	@RequestMapping(value = "/groupadmin", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchgroupInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /codeMng/groupadmin init");
		request.setCharacterEncoding("UTF-8");
		return "F_CodegroupList";
	}
	
	// 검색 조회
	@RequestMapping(value = "/groupadmin/search", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map searchgroupList(@RequestParam(value="codeGroup", required=false) String codeGroup, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /codeMng/groupadmin/search");
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();	// 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 조회결과
		
		// 검색조건 설정
		searchMap.put("codeGroup", codeGroup);

		// 데이터 조회
		List<F003CodegroupVO> data = f003CodeService.searchgroupList(searchMap);
		logger.info(data.toString());
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/groupadmin/save", method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf8")
	@ResponseBody
	public Map savegroupData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /codeMng/groupadmin/save");
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
			f003CodeService.savegroupData(dataMap);
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
	
	// 기본 화면 , 코드 조회
	@RequestMapping(value = "/codeadmin", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchcodeInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /codeMng/codeadmin init");
		request.setCharacterEncoding("UTF-8");
		return "F_CodeList";
	}
	
	// 검색 조회
	@RequestMapping(value = "/codeadmin/search", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map searchCodeList(@RequestParam(value="codeId", required=false) String codeId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /codeMng/groupadmin/search");
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();	// 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>();	// 조회결과
		
		// 검색조건 설정
		searchMap.put("codeId", codeId);

		// 데이터 조회
		List<F003CodeVO> data = f003CodeService.searchcodeList(searchMap);
		logger.info(data.toString());
		resultMap.put("Data", data);
		
		return resultMap;
	}
		
	@RequestMapping(value = "/codeadmin/save", method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf8")
	@ResponseBody
	public Map savecodeData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get,post /codeMng/codeadmin/save");
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
			f003CodeService.savecodeData(dataMap);
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
