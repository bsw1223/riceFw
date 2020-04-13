
package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001DocService;
import com.rice.C001.boardvo.C001ClassBoardVO;

@Controller

@RequestMapping("/mypage/board/*")
public class C001DocContoller {

	@Autowired
	private C001DocService c001DocService;

	@RequestMapping(value = "/{boCode}/{boURL}", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		
		List<C001ClassBoardVO> DocBoard = c001DocService.getList(cri);
		model.addAttribute("listB", DocBoard);
		model.addAttribute("pageMaker", new PageDTO(cri, c001DocService.getTotal()));
		return "C_DocList";

	}

	@RequestMapping(value = "/get.do", method = RequestMethod.GET)
	public String get(@RequestParam("boNum") String boNum, Model model) {
		
		model.addAttribute("docBoard", c001DocService.read(boNum));

		return "get";
	}


}
