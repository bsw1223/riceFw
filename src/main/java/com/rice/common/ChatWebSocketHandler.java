package com.rice.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.rice.C002.chatservice.C002ChatService;

@RequestMapping("/echo")
public class ChatWebSocketHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
	@Autowired
	private C002ChatService c002ChatService;
	
//	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	private List<WebSocketSession> users = new ArrayList<WebSocketSession>();
	private Map<String, Object> userMap = new HashMap<String, Object>();
	
	//클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info(session.getId() + " 연결 됨"); 
//        users.put(session.getId(), session);   
        users.add(session);
    }
    
    // 클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	logger.info(session.getId() + " 연결 종료됨");
//    	users.remove(session.getId());
    	users.remove(session);
    }
    
    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	logger.info(session.getId() + "로부터 메시지 수신: " + message.getPayload());    	
    	JSONObject object = new JSONObject(message.getPayload());
    	String type = object.getString("type");
    	
    	if(type != null && type.equals("register")) {
    		// 등록 요청 메시지
    		String user = object.getString("userid");
    		logger.info("user ==== " + user);
    		logger.info("session ==== " + session.getId());
    		// 아이디랑 session 이랑 매핑 >>> Map
    		userMap.put(user, session);
    		logger.info(userMap.toString());
    	} else {
    		// 채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼 것이기 때문에
    		// Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
    		logger.info(userMap.toString());
    		String target = object.getString("send_target");
    		logger.info("target ==== " + target);
    		WebSocketSession ws = (WebSocketSession) userMap.get(target);
    		logger.info("WebSocketSession " + ws.getId());
//    		String msg = object.getString("send_msg");
    		if(ws != null) {
//    			ws.sendMessage(new TextMessage(msg));
    			ws.sendMessage(message);
    		}
    	}
    	
//    	Map<String, Object> map = session.getAttributes();
//    	String name = (String) map.get("name");
//    	logger.info("================>> name:"+name);
//    	
//    	for(WebSocketSession s : users.values()) {
//    		s.sendMessage(message);	
//    		logger.info(s.getId() + "에 메시지 발송: " + message.getPayload());
//    	}
    }
   
    // error 발생시 실행
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
    	logger.info(session.getId() + " 익셉션 발생: " + exception.getMessage());
    }
}
