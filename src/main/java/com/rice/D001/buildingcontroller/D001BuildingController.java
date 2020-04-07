package com.rice.D001.buildingcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/Blddesc", method = RequestMethod.GET)
	public String get(@RequestParam("bulId") String bulId, Model model) {

		model.addAttribute("building", d001BuildingService.read(bulId));

		return "D_BuildingGet";
	}

}
