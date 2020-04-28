package com.rice.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.rice.A001.memvo.A001MemVO;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(HandshakeInterceptor.class);
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
		System.out.println("Before Handshake");

		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI:" + request.getURI());

		HttpServletRequest req = ssreq.getServletRequest();

		// HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
		A001MemVO vo = (A001MemVO) req.getSession().getAttribute("loginMem");
		attributes.put("memNum", vo.getMemNum());
		System.out.println("HttpSession에 저장된 memNum:" + vo.getMemNum());

		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
		System.out.println("After Handshake");

		super.afterHandshake(request, response, wsHandler, ex);
	}

}
