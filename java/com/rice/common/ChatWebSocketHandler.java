package com.rice.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rice.A001.memvo.A001MemVO;
import com.rice.C002.chatservice.C002ChatService;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
	@Autowired
	private C002ChatService c002ChatService;
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, Map<String, WebSocketSession>> chatroomMap = new HashMap<String, Map<String, WebSocketSession>>();
	
	//클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info(session.getId() + " 연결 됨");     
        users.put(session.getId(), session);   
    }
    
    // 클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	logger.info(session.getId() + " 연결 종료됨");
    	users.remove(session.getId());
    	
    	for(String key : chatroomMap.keySet() ) {
    		Map<String, WebSocketSession> chatmemMap = chatroomMap.get(key);
    		chatmemMap.remove(session.getId());
    	}
    }
    
    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	logger.info(session.getId() + "로부터 메시지 수신: " + message.getPayload());    	
    	JSONObject object = new JSONObject(message.getPayload());
    	HashMap<String, Object> rs = new ObjectMapper().readValue(object.toString(), HashMap.class);    	
    	String type = object.getString("type");
    	
    	if(type != null && type.equals("register")) { // 등록 요청 메시지
    		String user = object.getString("userid");
    		List<String> chatIdList = c002ChatService.getmychatIdList(user);
    		// 아이디랑 session 이랑 매핑 >>> Map
    		for(String chatroomId : chatIdList) {
    			if(chatroomMap.containsKey(chatroomId)) { 		// 이미 열린 채팅방일 경우
    				Map<String, WebSocketSession> chatmemMap = chatroomMap.get(chatroomId);
    				chatmemMap.put(session.getId(), session);
    			} else {										// 열리지 않은 채팅방일 경우
    				Map<String, WebSocketSession> chatmemMap = new HashMap<String, WebSocketSession>();
    				chatmemMap.put(session.getId(), session);
    				chatroomMap.put(chatroomId, chatmemMap);
    			}
    		}
    	} else {
    		// 채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼 것이기 때문에
    		// Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
    		String target = object.getString("send_target");
    		Map<String, WebSocketSession> chatmemList = chatroomMap.get(target);
    		
			for (String key : chatmemList.keySet()) {
				WebSocketSession ws = chatmemList.get(key);
				ws.sendMessage(message);
//				logger.info(ws.getId() + "에 메시지 발송: " + message.getPayload());
			}
			c002ChatService.insertMsg(rs);
    	}
    }
   
    // error 발생시 실행
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
    	logger.info(session.getId() + " 익셉션 발생: " + exception.getMessage());
    }
}
