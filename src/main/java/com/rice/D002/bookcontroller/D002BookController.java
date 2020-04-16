package com.rice.D002.bookcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@RequestMapping(value = "/getClassList", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getClassList(HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> resultMap = d002BookService.getClassList();
		
		return resultMap;
	}
	
	@RequestMapping(value = "/getBookingList", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getBookingList(HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> resultMap = d002BookService.getBookingList();
		
		return resultMap;
	}
	
	@RequestMapping(value = "/getBookingInfo", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map getBookingInfo(@RequestParam("bookNum") String bookNum, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> resultMap = d002BookService.getBookingList();
		
		return null;
	}
}
