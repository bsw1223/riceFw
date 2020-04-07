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
import com.rice.D001.buildingservice.D001ClassService;
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
	
	@RequestMapping(value = "/classrdesc", method = RequestMethod.GET)
	public String get(@RequestParam("classId") String classId, Model model) {

		model.addAttribute("class", d001ClassService.read(classId));

		return "D_ClassGet";
	}
}
