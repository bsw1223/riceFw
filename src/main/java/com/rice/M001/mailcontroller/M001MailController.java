package com.rice.M001.mailcontroller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rice.M001.mailservice.M001MailService;

@Controller
@EnableAsync
public class M001MailController {
	@Autowired
	private M001MailService mailService;
	
	@RequestMapping(value = "/sendMailTest", method=RequestMethod.GET)
	public void sendSimepleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html:charset=utf-8");
		
		PrintWriter out = response.getWriter();
		mailService.sendMail("yeon8462@hanmail.net", "TESTMail hanmail", "hanmail test메일입니다");
		mailService.sendPreConfiguredMail("naver test mail 입니다.");
	}
}
