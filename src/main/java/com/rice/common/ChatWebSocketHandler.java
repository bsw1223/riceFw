package com.rice.common;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class ChatWebSocketHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
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
    }
    
    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	logger.info(session.getId() + "로부터 메시지 수신: " + message.getPayload());
    	
    	Map<String, Object> map = session.getAttributes();
    	String name = (String) map.get("name");
    	logger.info("================>> name:"+name);
    	
    	for(WebSocketSession s : users.values()) {
    		s.sendMessage(message);
    		logger.info(s.getId() + "에 메시지 발송: " + message.getPayload());
    	}
    }
   
    // error 발생시 실행
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
    	logger.info(session.getId() + " 익셉션 발생: " + exception.getMessage());
    }
}
