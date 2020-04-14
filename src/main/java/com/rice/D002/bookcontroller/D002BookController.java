package com.rice.D002.bookcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rice.D002.bookservice.D002BookService;

@Controller
@RequestMapping("/booking/*")
public class D002BookController {
	private static final Logger logger = LoggerFactory.getLogger(D002BookController.class);
	
	@Autowired
	private D002BookService d002BookService;
	
	@RequestMapping(value = "/bookstudyroom", method = RequestMethod.GET)
	public String getBookStudyroom(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /bookstudyroom");
		return "D_Bookstudyroom";
	}
}
