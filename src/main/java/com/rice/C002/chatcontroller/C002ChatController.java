package com.rice.C002.chatcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		logger.info("get /chat/home");
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
}
