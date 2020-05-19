package com.rice.D001.buildingcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.D001.buildingservice.D001ClassService;
import com.rice.D001.buildingvo.D001BuildingVO;
import com.rice.D001.buildingvo.D001ClassVO;

@Controller
@RequestMapping("/classMng/MngBld/*")
public class D001ClassController {
	@Autowired
	private D001ClassService d001ClassService;
	@RequestMapping(value = "/classr", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {
		List<D001ClassVO> listClass = d001ClassService.getList(cri);
		model.addAttribute("listC", listClass);
		model.addAttribute("pageMaker", new PageDTO(cri, d001ClassService.getTotal()));
		return "D_ClassList";
	}
	
	  //강의실 상세보기
	  @RequestMapping(value = "/classrdesc", method = RequestMethod.GET) 
	  public String get(@RequestParam("classId") String classId, Model model) {
	  model.addAttribute("classId", classId);
	  System.out.println("classId = "+classId);
	  return "D_ClassroomDetail"; 
	  }
	//--------------------------------------------------------------
	//강의실 상세보기
	
	// 강의실정보 읽어오기
	@RequestMapping(value = "/classrdescInfo", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getClassInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String classId= request.getParameter("classId");
		List<Map<String, Object>>map = d001ClassService.selectClassInfo(classId);
		String mapList = mapper.writeValueAsString(map);
		return  mapList;
	}
	
	//강의실 등록 뷰로 이동
	@RequestMapping("/classadd")
	public String classadd(Model model, HttpServletRequest request) {
		return "D_ClassroomAdd";
	}
	
	
	//강의실 등록에서 강의실정보 불러오기
	@RequestMapping(value = "/classroomadd/classrInfo", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getClRInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>>map = d001ClassService.selectClRnfo();
		String mapList = mapper.writeValueAsString(map);
		return  mapList;
	}

	
//--------------------------------------------------------------		
	//강의실등록에서 강의실 등록
	@RequestMapping(value = "/classroomMng/MngBld", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public void buildAdd(D001BuildingVO d001BuildVO, Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		d001ClassService.insertClR(d001BuildVO);
	}
	
	//강의실등록에서 건물 이름 가져오기
	@RequestMapping(value = "/classroomadd/getbullid", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBulId(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("controller getbuildid");
		List<Map<String, Object>>map = d001ClassService.selectBulName();
		String mapList = mapper.writeValueAsString(map);
		System.out.println("controller -> jsp 전송 완료");
		return  mapList;
	}	
	
	
}
