package com.rice.E001.commcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.E001.commservice.E001CommBoardService;
import com.rice.E001.commservice.E001CommService;
import com.rice.E001.commvo.E001CommBoardVO;
import com.rice.E001.commvo.E001CommVO;

@Controller
@RequestMapping("/comm/*")
public class E001CommController {

	@Autowired
	public E001CommBoardService e001CommBoardService;
	@Autowired
	public E001CommService e001CommService;

	@RequestMapping(value = "/writingslist", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {

		List<E001CommBoardVO> commboardlist = e001CommBoardService.getList(cri);
		model.addAttribute("commboardlist", commboardlist);
		model.addAttribute("pageMaker", new PageDTO(cri, e001CommBoardService.getTotal()));
		return "E_CommBoard";

	}

	@RequestMapping(value = "/viewwritings", method = RequestMethod.GET)
	public String get(@RequestParam("boNum") String boNum, Model model,  HttpServletRequest request, HttpServletResponse response) {

		e001CommBoardService.updateViewCnt(boNum); 
		model.addAttribute("comm", e001CommBoardService.read(boNum));

		return "E_CommBoardGet";
		}
		


	@RequestMapping(value = "/viewupdate", method = RequestMethod.GET)
	public String updateBoard(E001CommBoardVO boardvo, HttpServletRequest request, HttpServletResponse response) {

		e001CommBoardService.update(boardvo);

		return "redirect:/comm/writingslist";
	}

	@RequestMapping(value = "/listdelete", method = RequestMethod.GET)
	public String remove(@RequestParam("boNum") String boNum, RedirectAttributes rttr) {

		if (e001CommBoardService.delete(boNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/comm/writingslist";
	}
	
	@RequestMapping(value = "/makecomm", method = RequestMethod.GET)
	public String makecomm(HttpServletRequest request, Model model, E001CommVO e001commvo) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		model.addAttribute("memId", vo.getMemId());
		model.addAttribute("memLevel", vo.getMemLevel());

		return "E_CommCrt";
	}
	@RequestMapping(value = "/commRegister", method = RequestMethod.GET)
	public String commRegister(HttpServletRequest request, Model model, E001CommVO e001commvo) {
		
		e001CommService.commReg(e001commvo);
		
		return "redirect:/comm/makecomm";
	}

}
