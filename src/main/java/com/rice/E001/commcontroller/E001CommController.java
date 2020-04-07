package com.rice.E001.commcontroller;

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
import com.rice.E001.commservice.E001CommBoardService;
import com.rice.E001.commvo.E001CommBoardVO;

@Controller
@RequestMapping("/comm/*")
public class E001CommController {
	
	@Autowired
	public E001CommBoardService e001CommBoardService;
	
	@RequestMapping(value = "/viewwritings", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {

		List<E001CommBoardVO> commboardlist = e001CommBoardService.getList(cri);
		model.addAttribute("commboardlist", commboardlist);
		model.addAttribute("pageMaker", new PageDTO(cri, e001CommBoardService.getTotal()));
		return "E_CommBoard";

	}
	
}
