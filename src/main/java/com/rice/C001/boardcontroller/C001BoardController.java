package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001BoardService;
import com.rice.C001.boardvo.C001BoardVO;

@Controller
@RequestMapping("/")
public class C001BoardController {

	@Autowired
	private C001BoardService c001BoardService;

	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {

		List<C001BoardVO> listBoard = c001BoardService.getList(cri);
		model.addAttribute("listB", listBoard);
		model.addAttribute("pageMaker", new PageDTO(cri, c001BoardService.getTotal()));
		return "board";

	}

	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String register(C001BoardVO boardvo, RedirectAttributes rttr) {

		return "register";
	}

	@RequestMapping(value = "/boardRegister.do", method = RequestMethod.GET)
	public String boardRegister(C001BoardVO boardvo, HttpServletRequest request, HttpServletResponse response) {

		c001BoardService.register(boardvo);

		return "redirect:/board.do";
	}

	@RequestMapping(value = "/get.do", method = RequestMethod.GET)
	public String get(@RequestParam("bno") Long bno, Model model) {

		model.addAttribute("board", c001BoardService.read(bno));

		return "get";
	}

	@RequestMapping(value = "/boardContents.do", method = RequestMethod.GET)
	public String boardContents(Model model, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("踰⑤쪟�꽆�뼱�삤�굹�슂" + request.getParameter("value"));

		int value = Integer.parseInt(request.getParameter("value"));
		// �럹�씠吏�踰덊샇 諛쏆쓬
		List<C001BoardVO> oneValue = null;
		oneValue = c001BoardService.getSelectOne(value);
		model.addAttribute("value", oneValue);

		return "boardContent";

	}

	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String update(@RequestParam("bno") Long bno, Model model) {

		model.addAttribute("board", c001BoardService.read(bno));

		return "modify";
	}

	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET)
	public String updateBoard(C001BoardVO boardvo, HttpServletRequest request, HttpServletResponse response) {
		
		c001BoardService.update(boardvo);

		return "redirect:/board.do";
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {

		if (c001BoardService.delete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board.do";
	}

}
