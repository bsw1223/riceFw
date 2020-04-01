package com.rice.A001.memcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.A001.memdao.A001MemDAO;
import com.rice.A001.memservice.A001MemService;
import com.rice.A001.memvo.A001MemVO;

@Controller
@RequestMapping("/member/*")
public class A001MemController { 
	private static final Logger logger = LoggerFactory.getLogger(A001MemController.class);
	
	@Autowired
	private A001MemService a001MemService;
	@Autowired
	private A001MemDAO a001MemDAO;
	
	// GET 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String getLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "Alogin";
	}
	
	// POST 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String postLogin(A001MemVO vo, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		A001MemVO login = null;
		try {
			login = a001MemService.login(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(login == null) {
			session.setAttribute("member", null);
			System.out.println("login fail");
		} else {
			session.setAttribute("member", login);
			System.out.println("login ok");
		}
		
		return "redirect:/";
	}
	
	
	// GET Account 회원가입 선택
	@RequestMapping(value = "/account.do", method = RequestMethod.GET)
	public String account(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get account.do");
		return "Aaccount";
	}
	
	// 회원가입 GET
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String getSignup(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get signup.do");
		return "Asignup";
	}
	
	// 회원가입 POST
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String postSignup(A001MemVO vo, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post signup.do");
		int idCheck = 1;
		try {
			idCheck = a001MemService.idCheck(vo.getMemId());
			if(idCheck == 1) {
				return "/member/register";
			} else if(idCheck == 0) {
				a001MemService.signup(vo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/member/login.do";
	}
	
	// POST memId 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST )
	@ResponseBody
	public String idCheck (@RequestBody String memId, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post idCheck.do");
		String idCheck = "1";
		try {
			idCheck = Integer.toString(a001MemService.idCheck(memId));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idCheck;
	}
	
	
	
	
	
	
	
//	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
//	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
//		
//		String id = request.getParameter("id");
//		List<A001MemVO> listMem = a001MemService.selectMem(id);
//		
//		model.addAttribute("listMem",listMem);
//		
//		return "list";
//		
//	}	

}
