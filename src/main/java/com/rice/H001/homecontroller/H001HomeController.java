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
import com.rice.H001.homevo.H001HomeVO;

import com.fasterxml.jackson.core.JsonProcessingException; 
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
@RequestMapping("/*")
public class H001HomeController {
	@Autowired
	private H001HomeService h001HomeService;
	private H001HomeVO h001HomeVO;
	
	private static final Logger logger = LoggerFactory.getLogger(H001HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {		
		return "index";
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String main(Model model, HttpServletRequest request) throws JsonProcessingException {
		
		ObjectMapper mapper = new ObjectMapper();
		String authId= request.getParameter("authId");
		List<Map<String, Object>>map = h001HomeService.getMenuList((String)authId);//1000은 테스트용  authId로 변경해야함
		String mapList = mapper.writeValueAsString(map);

		
		return  mapList;
	}
	
	@RequestMapping(value = "/sublist", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String sublist(Model model, HttpServletRequest request) throws JsonProcessingException {
		
		ObjectMapper mapper = new ObjectMapper();
		
		String memnum= request.getParameter("memnum");
		List<Map<String, Object>>map = h001HomeService.selectSubjectList((String)memnum);//1000은 테스트용  authId로 변경해야함
		String mapListSub = mapper.writeValueAsString(map);
		
		return  mapListSub;
	}
	
	
	
	
	
	
}
