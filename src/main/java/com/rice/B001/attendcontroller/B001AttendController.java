package com.rice.B001.attendcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/attend/*")
public class B001AttendController {
	private static final Logger logger = LoggerFactory.getLogger(B001AttendController.class);
	
	// 출석 체크 페이지
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request, HttpServletResponse response) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = request.getRemoteAddr();
		}
		
		logger.info("ip========= : " + ip);
		
		return "B_001check";
	}
}
