package com.rice.H001.homecontroller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.H001.homeservice.H001HomeService;
import com.rice.H001.homeservice.H001SchService;
import com.rice.H001.homevo.H001HomeVO;
import com.rice.H001.homevo.H001SchVO;
import com.fasterxml.jackson.core.JsonProcessingException; 
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
@RequestMapping("/*")
public class H001SchController {
	//스케쥴 받기
	@Autowired
	private H001SchService h001SchService;
	private H001SchVO h001SchVO;
	
	private static final Logger logger = LoggerFactory.getLogger(H001SchController.class);
	@RequestMapping(value = "data.json", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public List schlist(Model model, HttpServletRequest request) throws JsonProcessingException  {
		ObjectMapper mapper = new ObjectMapper();
		String memNum= (String)request.getParameter("memNum");
		System.out.println("memNum : "+ memNum);
		
		List<Map<String, Object>>map = h001SchService.selectSchList(memNum);
		String response = mapper.writeValueAsString(map);
		System.out.println("map : "+ map);
		
		return  map;
	}
	
	//스케쥴 수정
	@RequestMapping(value = "schModify", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public void schlist(H001SchVO h001SchVO, HttpServletRequest request) throws JsonProcessingException  {
	
		h001SchService.ModifySchInfo(h001SchVO);
		System.out.println("h001SchVO.toString() : " + h001SchVO.toString());
	}
	
	
	
	
	
}
