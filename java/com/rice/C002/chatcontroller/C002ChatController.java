package com.rice.C002.chatcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C002.chatservice.C002ChatService;
import com.rice.C002.chatvo.C002ChatroomVO;


@Controller
@RequestMapping("/chat")
public class C002ChatController {
	private static final Logger logger = LoggerFactory.getLogger(C002ChatController.class);
	
	@Autowired
	private C002ChatService c002ChatService;
	
	@RequestMapping(value= "", method = RequestMethod.GET)
	public String loadChat(HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /chat");	
		return "C_002Chat";
	}
	
	@RequestMapping(value = "/getChatroomList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	// 채팅방 목록 가져오기
	public List getChatroomList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getChatroomList");
		List<C002ChatroomVO> resultMap = null;
		resultMap = c002ChatService.getChatroomList(info);
		
		return resultMap;
	}
	
	// 친구목록 가져오기
	@RequestMapping(value = "/getFriendList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getFriendList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getFriendList");
		List<Map<String, Object>> resultMap = null;
		List<Map<String, Object>> tmp = null;
		List<String> classList = null;
		
		if(info.get("authId").equals("1001")) {	// 학생일 경우
			classList = c002ChatService.getMyClassList(info);
			if (classList.isEmpty()) {
				return resultMap;
			}
			info.put("classList", classList);
			resultMap = c002ChatService.getclassFriendList(info);
			tmp = c002ChatService.getTeaList(info);
			resultMap.addAll(tmp);
		} else if(info.get("authId").equals("1002")) { // 강사일 경우
			classList = c002ChatService.getTeaClassList(info);
			if (classList.isEmpty()) {
				return resultMap;
			}
			info.put("classList", classList);
			resultMap = c002ChatService.getclassStuList(info);
		}

		return resultMap;
	}
	
	// 채팅방에 추가 선택한 멤버 정보 가져오기
	@RequestMapping(value = "/getmemInfo", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getmemInfo(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getmemInfo");
		List<Map<String, Object>> resultMap = null;
		resultMap = c002ChatService.getmemInfo(info);
		return resultMap;
	}
	
	// 채팅방 새로 만들기
	@RequestMapping(value = "/insertChatroom", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public String insertChatroom(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get/post /insertChatroom");
		String result = "0";
		String chatroomId = c002ChatService.getchatroomId();
		info.put("chatroomId", chatroomId);
		
		try {
			c002ChatService.insertChatroom(info);
			result = chatroomId;
		} catch (Exception e) {
			result = "0";
		}

		return result;
	}
	
	// 채팅방 정보 가져오기
	@RequestMapping(value = "/getChatroomInfo", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getChatroomInfo(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get/post /getChatroomInfo");
		Map<String, Object> resultMap = new HashMap<String, Object>();
	
		String headmemNum = c002ChatService.getmakeMember(info);
		resultMap.put("headmemNum", headmemNum);	// 방장 번호 입력
		List<Map<String, Object>> chatroomInfo = c002ChatService.getChatroomInfo(info);
		resultMap.put("chatroomInfo", chatroomInfo);	// 해당 방의 정보 
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	// 채팅방 최근 메시지 가져오기
	@RequestMapping(value = "/getpastMsg", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getpastMsg(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get/post /getpastMsg");
		List<Map<String, Object>> resultMap = null;
		resultMap = c002ChatService.getpastMsg(info);
		return resultMap;
	}
	
	// 채팅방 이름 수정
	@RequestMapping(value = "/updateChatroomName", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map updateChatroomName(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get/post /updateChatroomName");
		Map<String, String> resultMap = new HashMap<String, String>();
		
		try {
			c002ChatService.updateChatroomName(info);
			resultMap.put("result_msg", "1");	// 업데이트 성공시
		} catch (Exception e) {
			resultMap.put("result_msg", "0");	// 업데이트 실패시
		}
		
		return resultMap;
	}
	
	// 채팅방 나가기
	@RequestMapping(value = "/deleteMemberChat", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map deleteMemberChat(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get/post /deleteMemberChat");
		Map<String, String> resultMap = new HashMap<String, String>();
		
		try {
			c002ChatService.deleteMemberChat(info);
			resultMap.put("result_msg", "1");	// 나가기 성공시
		} catch (Exception e) {
			resultMap.put("result_msg", "0");	// 나가기 실패시
		}
		
		return resultMap;
	}
}
