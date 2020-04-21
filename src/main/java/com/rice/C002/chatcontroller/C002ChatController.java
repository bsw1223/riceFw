package com.rice.C002.chatcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/chat")
public class C002ChatController {
	private static final Logger logger = LoggerFactory.getLogger(C002ChatController.class);
	
	@RequestMapping(value= "", method = RequestMethod.GET)
	public String loadChat(HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /chat/home");
		return "C_002Chat";
	}
}
