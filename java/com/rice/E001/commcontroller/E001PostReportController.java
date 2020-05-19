package com.rice.E001.commcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.E001.commservice.E001PostReportService;
import com.rice.E001.commvo.E001PostReportVO;

@Controller
@RequestMapping("/postreportMng/*")
public class E001PostReportController {
	
	@Autowired
	public E001PostReportService e001PostReportService;

	@RequestMapping(value = "/postreportlist", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {

		List<E001PostReportVO> pstReportlist = e001PostReportService.getList(cri);
		model.addAttribute("pstReportlist", pstReportlist);
		model.addAttribute("pageMaker", new PageDTO(cri, e001PostReportService.getTotal()));
		return "E_PostReport";

	}
}
