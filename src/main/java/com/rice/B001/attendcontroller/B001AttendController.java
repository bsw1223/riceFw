package com.rice.B001.attendcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.B001.attendservice.B001AttendService;

@Controller
@RequestMapping("/attend/*")
public class B001AttendController {
	private static final Logger logger = LoggerFactory.getLogger(B001AttendController.class);
	
	@Autowired
	private B001AttendService b001AttendService;
	
	// 출석 체크 페이지
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String getCheckPage(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /attend/check");
		
		return "B_001check";
	}
	
	// 내 수업 목록 가져오기  + ip 대역 check 하기
	@RequestMapping(value = "/getClassList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getClassList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getChatroomList");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, String> ipAdd = b001AttendService.getIpAddress();
		
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr() ;
		}
		logger.info("접속 ip==========" + ip);
		Long ipAddressLong = getLongip(ip);
		
		if(ipAddressLong >= getLongip(ipAdd.get("ipStart1")) && ipAddressLong <= getLongip(ipAdd.get("ipEnd1"))) {
			resultMap.put("ip_msg", "true");
		} else if (ipAddressLong >= getLongip(ipAdd.get("ipStart2")) && ipAddressLong <= getLongip(ipAdd.get("ipEnd2"))) {
			resultMap.put("ip_msg", "true");
		} else {
			resultMap.put("ip_msg", "false");
		}
		
		List<Map<String, Object>> resultTmp = null;
		resultTmp = b001AttendService.getClassList(info);
		resultMap.put("classList", resultTmp);
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}

	// 출석 체크
	@RequestMapping(value = "/checkAttend", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> checkAttend(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /checkAttend");
		Map<String, Object> resultMap = new HashMap<String, Object>();

		if(b001AttendService.checkEmailPwd(info) == 0) {
			logger.info("1st false");
			resultMap.put("check_msg", "meminfo_false");
			return new ResponseEntity(resultMap, HttpStatus.OK);
		}
		
		if(b001AttendService.checkClassTime(info) == 0) {
			logger.info("2nd false");
			resultMap.put("check_msg", "time_false");
			return new ResponseEntity(resultMap, HttpStatus.OK);
		}
		
		Map<String, Object> tmp =  b001AttendService.getinsertVal(info);
		tmp.put("currentDate", info.get("currentDate"));
		tmp.put("currentTime", info.get("currentTime"));
		logger.info("tmp =============" + tmp.toString());
		try {
			b001AttendService.insertAttendance(tmp);
			resultMap.put("check_msg", "ok");
		} catch (Exception e) {
			logger.info("3rd false");
			resultMap.put("check_msg", "attend_false");
		}
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	public Long getLongip(String ip) {
		String [] ipArr = ip.split("\\.");
		long ipAddressLong = (Long.parseLong(ipArr[0]) << 24) +
				(Long.parseLong(ipArr[1]) << 16) +
				(Long.parseLong(ipArr[2]) << 8) +
				(Long.parseLong(ipArr[3]));
		
		return ipAddressLong;
	}
	
	// 출석 현황 페이지
	@RequestMapping(value = "/status", method = RequestMethod.GET)
	public String getStatusPage(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /attend/status");
		
		return "B_002status";
	}
	
	// 출석 데이터 가져오기
	@RequestMapping(value = "/getAttendData", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getAttendData(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getAttendData");
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> classList = b001AttendService.getClassList(info);
		
		for(int i = 0 ; i < classList.size() ; i++) {
			String openclassId = (String) classList.get(i).get("openclassId");
			info.put("openclassId", openclassId);
			Map<String, Object> tmp = b001AttendService.getAttendData(info);
			resultList.add(tmp);
		}
		
		return new ResponseEntity(resultList, HttpStatus.OK);
	}
	
	// 한 과목 출석 list 가져오기
	@RequestMapping(value = "/getAttendList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getAttendList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getAttendList");
		List<Map<String, Object>> resultList= b001AttendService.getAttendList(info);
		
		return new ResponseEntity(resultList, HttpStatus.OK);
	}
}
