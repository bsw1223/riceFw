package com.rice.D001.buildcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rice.D001.buildservice.D001BuildService;
import com.rice.D001.buildvo.D001BuildVO;



@Controller
public class D001BuildController { 
	private static final Logger logger = LoggerFactory.getLogger(D001BuildController.class);
	
	@Autowired
	private D001BuildService d001BuildService;
	
	//건물 상세보기
	@RequestMapping(value = "/buildmng/*", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		return "DBuildingDetail";
	}
	@RequestMapping(value = "/mngbld/blddesc", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBuildInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String bulId= request.getParameter("bulId");
		System.out.println("build : "+bulId);
		List<Map<String, Object>>map = d001BuildService.selectInfo(bulId);//1000은 테스트용  authId로 변경해야함
		String mapList = mapper.writeValueAsString(map);
		return  mapList;
		
	}
	
	
	
	//강의실 상세보기
	@RequestMapping("/classrmng/*")
	public String classHome(Model model, HttpServletRequest request) {
		return "DClassroomDetail";
	}
	
	
	//강의실등록에서 강의실정보 읽어오기
	@RequestMapping(value = "/mngbld/classrdesc", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getClassInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String classId= request.getParameter("classId");
		List<Map<String, Object>>map = d001BuildService.selectClassInfo(classId);
		String mapList = mapper.writeValueAsString(map);
		
		return  mapList;
		
	}
	
	
	
	
	//강의실 등록 뷰로 이동----------------------------------
	@RequestMapping("/classroomadd/*")
	public String classadd(Model model, HttpServletRequest request) {
		return "DClassroomAdd";
	}
	
	
	//강의실 등록에서 강의실정보 불러오기
	@RequestMapping(value = "/classroomadd/classrInfo", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getClRInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>>map = d001BuildService.selectClRnfo();
		String mapList = mapper.writeValueAsString(map);
		return  mapList;
		
	}

	
	
	//강의실등록에서 건물 이름 가져오기
	@RequestMapping(value = "/classroomadd/getbullid", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBulId(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("controller getbuildid");
		List<Map<String, Object>>map = d001BuildService.selectBulName();
		String mapList = mapper.writeValueAsString(map);
		System.out.println("controller -> jsp 전송 완료");
		return  mapList;
		
	}
	
	
	
	//강의실등록에서 강의실 등록
	@RequestMapping(value = "/classroomMng/MngBld", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public void buildAdd(D001BuildVO d001BuildVO, Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		String classCode= d001BuildVO.getClassCode();
		int classNumber = d001BuildVO.getClassNumber();
		String bulName= d001BuildVO.getBulName();
		String classRemark = d001BuildVO.getClassRemark();
		int classCapacity =d001BuildVO.getClassCapacity();
		String bulId = d001BuildVO.getBulId();
		System.out.println("classCode : "+classCode);
		System.out.println("classNumber : "+classNumber);
		System.out.println("bulName : "+bulName);
		System.out.println("classRemark : "+classRemark);
		System.out.println("classCapacity : "+classCapacity);
		System.out.println("bulId : "+bulId);
		String getBulId = d001BuildVO.getBulId();
		System.out.println("getBulId : "+getBulId);
		d001BuildService.insertClR(d001BuildVO);
		
		
	}
	
	
	
	
}

