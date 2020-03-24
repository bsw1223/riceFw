package com.rice.A001.memcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rice.A001.memdao.A001MemDAO;
import com.rice.A001.memservice.A001MemService;
import com.rice.A001.memvo.A001MemVO;

@Controller
@RequestMapping("/")
public class A001MemController { 

	@Autowired
		private A001MemService a001MemService;
	@Autowired
		private A001MemDAO a001MemDAO;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
		public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
			return "login";
			
		}
		
		
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		List<A001MemVO> listMem = a001MemService.selectMem(id);
		
		model.addAttribute("listMem",listMem);
		
		return "list";
		
	}	
		
		
		
		
}
