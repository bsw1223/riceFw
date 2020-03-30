package com.rice.B001.attendcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/attendlist")
public class B001AttendController {
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request, HttpServletResponse response) {
	return "index";
	}
}
