
package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001DocService;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;

@Controller
@RequestMapping("/mypage/board/*")
public class C001DocContoller {

	@Autowired
	private C001DocService c001DocService;

	@RequestMapping(value = "/{boCode}/{boURL}", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		cri.setBoURL(boURL);
		cri.setBoCode(boCode);
		List<C001ClassBoardVO> DocBoard = c001DocService.getList(cri);
		model.addAttribute("listB", DocBoard);
		model.addAttribute("pageMaker", new PageDTO(cri, c001DocService.getTotal(cri)));
		String result_view = null;

		/*
		 * 페이지이동 HttpSession session = request.getSession(false); A001MemVO vo =
		 * (A001MemVO) session.getAttribute("loginMem"); if (vo == null) { return
		 * "redirect:/"; } else if (vo.getAuthId().equals("1001")) { // 학생 if
		 * (boURL.equals("2000")) { // 공지사항 result_view = "C_stdNoticeList "; } else if
		 * (boURL.equals("2001")) { // 자료게시판 result_view = "C_stdDocList"; } else if
		 * (boURL.equals("2002")) { // 과제게시판 result_view = "C_stdHwList"; } else if
		 * (boURL.equals("2003")) { // qna게시판 result_view = "C_stdQnaList"; } // 스터디 게시판
		 * 추가 필요 } else if (vo.getAuthId().equals("1002")) { // 강사 if
		 * (boURL.equals("2000")) { // 공지사항 result_view = "C_tchNoticeList "; } else if
		 * (boURL.equals("2001")) { // 자료게시판 result_view = "C_tchDocList"; } else if
		 * (boURL.equals("2002")) { // 과제게시판 result_view = "C_tchHwList"; } else if
		 * (boURL.equals("2003")) { // qna게시판 result_view = "C_tchQnaList"; } }
		 */
		return "C_tchDocList";
	}

	@RequestMapping(value = "/get/{boCode}/{boURL}", method = RequestMethod.GET)
	public String get(@RequestParam("boNum") String boNum, Model model, Criteria cri,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		c001DocService.updateViewCnt(boNum, boURL, boCode);
		model.addAttribute("list", c001DocService.read(boNum, boURL, boCode));
		
		return "C_tchDocGet";
	}

	@RequestMapping(value = "/regForm/{boCode}/{boURL}", method = RequestMethod.GET)
	public String regForm(C001ClassBoardVO boardvo, Model model,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		model.addAttribute("boURL", boURL);
		model.addAttribute("boCode", boCode);
		return "C_tchDocReg";
	}

	@RequestMapping(value = "/reg/{boCode}/{boURL}", method = RequestMethod.GET)
	public String reg(C001ClassBoardVO boardvo,HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode, Criteria cri) {
		cri.setBoURL(boURL);
		cri.setBoCode(boCode);
		c001DocService.register(boardvo);
		
		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;
		
		return nextPage;
	}

	@RequestMapping(value = "/mdfyForm/{boCode}/{boURL}", method = RequestMethod.GET)
	public String update(@RequestParam("boNum") String boNum, Model model,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {

		model.addAttribute("list", c001DocService.read(boNum,boURL,boCode));

		return "C_tchDocMdfy";
	}

	@RequestMapping(value = "/mdfy/{boCode}/{boURL}", method = RequestMethod.GET)
	public String updateBoard(C001ClassBoardVO boardvo, 
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		System.out.println(boardvo);
		c001DocService.update(boardvo);
		
		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;

		return nextPage;
	}

	@RequestMapping(value = "/dlt/{boCode}/{boURL}", method = RequestMethod.GET)
	public String remove(@RequestParam("boNum") String boNum, @PathVariable("boURL") String boURL,
			@PathVariable("boCode") String boCode) {
		
		c001DocService.delete(boNum, boURL, boCode);
		
		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;

		return nextPage;
	}

}
