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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.D001.buildingservice.D001BuildingService;
import com.rice.D001.buildingvo.D001BuildingVO;

@Controller
@RequestMapping("/classMng/MngBld/*")
public class D001BuildingController {

	@Autowired
	private D001BuildingService d001BuildingService;

	@RequestMapping(value = "/Bld", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {

		List<D001BuildingVO> listBuilding = d001BuildingService.getList(cri);
		model.addAttribute("listB", listBuilding);
		model.addAttribute("pageMaker", new PageDTO(cri, d001BuildingService.getTotal()));
		return "D_BuildingList";

	}

	
//---------------------------------------------------------------------------	

	@RequestMapping(value = "/Blddesc",method = {RequestMethod.GET, RequestMethod.POST})
	public String dBuildingDetail(@RequestParam("bulId") String bulId, Model model, HttpServletRequest request,RedirectAttributes rttr) {
//		rttr.addFlashAttribute("building", bulId);
		model.addAttribute("building", bulId);
		
		return "D_BuildingDetail";
	}
	
	@RequestMapping(value = "/BlddescInfo", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBuildInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String bulId= request.getParameter("bulId");
		List<Map<String, Object>>map = d001BuildingService.selectInfo(bulId);
		String mapList = mapper.writeValueAsString(map);
		return  mapList;
		
	}

}
