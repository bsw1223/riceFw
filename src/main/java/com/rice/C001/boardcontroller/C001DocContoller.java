
package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger(C001DocContoller.class);

	@Autowired
	private C001DocService c001DocService;

	@RequestMapping(value = "/{boCode}/{boURL}", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		cri.setBoURL(boURL);
		cri.setBoCode(boCode);
		List<C001ClassBoardVO> DocBoard = c001DocService.getList(cri);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		model.addAttribute("listB", DocBoard);
		model.addAttribute("pageMaker", new PageDTO(cri, c001DocService.getTotal(cri)));
		
		String result_view = null;
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		
		if (vo == null) {
			return "redirect:/";
		} else if (vo.getAuthId().equals("1001")) { // 학생
			if (boCode.equals("2000")) {
				result_view = "C_stdNoticeList";
			} else if (boCode.equals("2001")) {
				result_view = "C_stdDocList";
			} else if (boCode.equals("2002")) {
				result_view = "C_stdHwList";
			} else if (boCode.equals("2003")) {
				result_view = "C_stdQnaList";
			}else if(boCode.equals("2006")) {
				result_view ="C_stdTeamList";
			}
		} else if (vo.getAuthId().equals("1002")) { // 강사
			if (boCode.equals("2000")) { // 공지사항
				result_view = "C_tchNoticeList";
			} else if (boCode.equals("2001")) { // 자료게시판
				result_view = "C_tchDocList";
			} else if (boCode.equals("2002")) { // 과제게시판
				result_view = "C_tchHwList";
			} else if (boCode.equals("2003")) { // qna게시판
				result_view = "C_tchQnaList";
			} else if(boCode.equals("2004")) {	//
				List<A001MemVO> stdlist = c001DocService.getStdList(cri);
				System.out.println(stdlist);
				model.addAttribute("list", stdlist);
				result_view ="C_tchStdList";
			} else if(boCode.equals("2005")) {
				result_view ="C_tchGrdList";
			} else if(boCode.equals("2006")) {
				result_view ="C_tchTeamList";
			}
		}

		return result_view;
	}

	@RequestMapping(value = "/get/{boCode}/{boURL}", method = RequestMethod.GET)
	public String get(@RequestParam("boNum") String boNum, Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		String result_view = null;
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		c001DocService.updateViewCnt(boNum, boURL, boCode);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		model.addAttribute("list", c001DocService.read(boNum, boURL, boCode));
		if (vo == null) {
			return "redirect:/";
		} else if (vo.getAuthId().equals("1001")) { // 학생
			if (boCode.equals("2000")) {
				result_view = "C_stdNoticeGet";
			} else if (boCode.equals("2001")) {
				result_view = "C_stdDocGet";
			} else if (boCode.equals("2002")) {
				result_view = "C_stdHwGet";
			} else if (boCode.equals("2003")) {
				if(vo.getMemNum().equals(c001DocService.read(boNum, boURL, boCode).getMemNum())) {
					result_view = "C_stdQnaGet";
				}
				else {
					result_view="C_stdQna";
				}
			} else if(boCode.equals("2006")) {
				result_view = "C_stdTeamGet";
			}
		} else if (vo.getAuthId().equals("1002")) { // 강사
			if (boCode.equals("2000")) { // 공지사항
				result_view = "C_tchNoticeGet";
			} else if (boCode.equals("2001")) { // 자료게시판
				result_view = "C_tchDocGet";
			} else if (boCode.equals("2002")) { // 과제게시판
				result_view = "C_tchHwGet";
			} else if (boCode.equals("2003")) { // qna게시판
				result_view = "C_tchQnaGet";
			} else if(boCode.equals("2005")) {
				result_view ="C_tchGrdGet";
			} else if(boCode.equals("2006")) {
				result_view ="C_tchTeamGet";
			}
		}

		return result_view;
	}

	@RequestMapping(value = "/regForm/{boCode}/{boURL}", method = RequestMethod.GET)
	public String regForm(C001ClassBoardVO boardvo, Model model, @PathVariable("boURL") String boURL,HttpServletRequest request,
			@PathVariable("boCode") String boCode) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		model.addAttribute("memName", vo.getMemName());
		model.addAttribute("memNum", vo.getMemNum());
		model.addAttribute("boURL", boURL);
		model.addAttribute("boCode", boCode);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		String pageTitle = null;
		if (boCode.equals("2000")) { // 공지사항
			pageTitle = "공지사항 게시판";
		} else if (boCode.equals("2001")) { // 자료게시판
			pageTitle = "자료 게시판";
		} else if (boCode.equals("2002")) { // 과제게시판
			pageTitle = "과제 게시판";
		} else if(boCode.equals("2005")) {
			pageTitle ="성적 게시판";
		} else if(boCode.equals("2006")) {
			pageTitle ="스터디 게시판";
		} else if(boCode.equals("2003")) {
			pageTitle ="Q&A 게시판";
		}
		model.addAttribute("pageTitle", pageTitle);
		return "C_tchDocReg";
	}

	@RequestMapping(value = "/reg/{boCode}/{boURL}", method = RequestMethod.GET)
	public String reg(C001ClassBoardVO boardvo, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode, Criteria cri) {
		cri.setBoURL(boURL);
		cri.setBoCode(boCode);
		c001DocService.register(boardvo);

		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;

		return nextPage;
	}

	@RequestMapping(value = "/mdfyForm/{boCode}/{boURL}", method = RequestMethod.GET)
	public String update(@RequestParam("boNum") String boNum, Model model, @PathVariable("boURL") String boURL,
			@PathVariable("boCode") String boCode, HttpServletRequest request) {
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		model.addAttribute("list", c001DocService.read(boNum, boURL, boCode));
		
		String pageTitle = null;
		if (boCode.equals("2000")) { // 공지사항
			pageTitle = "공지사항 게시판";
		} else if (boCode.equals("2001")) { // 자료게시판
			pageTitle = "자료 게시판";
		} else if (boCode.equals("2002")) { // 과제게시판
			pageTitle = "과제 게시판";
		} else if(boCode.equals("2005")) {
			pageTitle ="성적 게시판";
		} else if(boCode.equals("2006")) {
			pageTitle ="스터디 게시판";
		} else if(boCode.equals("2003")) {
			pageTitle ="Q&A 게시판";
		}
		model.addAttribute("pageTitle", pageTitle);

		return "C_tchDocMdfy";
	}

	@RequestMapping(value = "/mdfy/{boCode}/{boURL}", method = RequestMethod.GET)
	public String updateBoard(C001ClassBoardVO boardvo, @PathVariable("boURL") String boURL, Model model,
			@PathVariable("boCode") String boCode) {
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
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
