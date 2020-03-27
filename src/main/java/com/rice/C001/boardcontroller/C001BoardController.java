package com.rice.C001.boardcontroller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.C001.boarddao.C001BoardDAO;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boarddto.PageUtil;
import com.rice.C001.boardservice.C001BoardService;
import com.rice.C001.boardvo.C001BoardVO;

@Controller
@RequestMapping("/")
public class C001BoardController { 

	@Autowired
		private C001BoardService c001BoardService;
	@Autowired
		private C001BoardDAO c001BoardDAO;
	
	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	
		public String list(Model model, @ModelAttribute("pageDTO") PageDTO dto,HttpServletRequest request, HttpServletResponse response) {
			
		List<C001BoardVO> listBoard = c001BoardService.listBoard();
		model.addAttribute("listB",listBoard);
		model.addAttribute("pageUtil", new PageUtil(dto, c001BoardService.getTotal()));
			return "board";
			
		}
		
		
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String Register1(C001BoardVO boardvo,  RedirectAttributes rttr) {
	
		return "register";
	}	
	
	
	@RequestMapping(value = "/boardRegister.do", method = RequestMethod.GET)
	public String Register(C001BoardVO boardvo,  RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) {
		
//		String writer= request.getParameter("writer");
//		String title= request.getParameter("title");
//		String content= request.getParameter("content");
//	
		
		c001BoardService.register(boardvo);

		
		return "redirect:/board.do";
	}	
	
		
		
		
		
}
