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

import com.rice.C001.boarddao.C001BoardDAO;
import com.rice.C001.boardservice.C001BoardService;
import com.rice.C001.boardvo.C001BoardVO;

import oracle.net.ano.Service;

@Controller
@RequestMapping("/")
public class C001BoardController { 

	@Autowired
		private C001BoardService c001BoardService;
	@Autowired
		private C001BoardDAO c001BoardDAO;
	
		/*
		 * @RequestMapping(value = "/board.do", method = RequestMethod.GET) public
		 * String list(Model model, HttpServletRequest request, HttpServletResponse
		 * response) {
		 * 
		 * List<C001BoardVO> listBoard = c001BoardService.listBoard();
		 * model.addAttribute("listB",listBoard); return "board";
		 * 
		 * }
		 * 
		 * 
		 * 
		 * 
		 * @RequestMapping(value = "/register.do", method = RequestMethod.GET) public
		 * String Register1(C001BoardVO boardvo, RedirectAttributes rttr) {
		 * 
		 * c001BoardService.register(boardvo);
		 * 
		 * return "register"; }
		 * 
		 * 
		 * 
		 * 
		 * @RequestMapping(value = "/boardRegister.do", method = RequestMethod.GET)
		 * public String Register(C001BoardVO boardvo, RedirectAttributes rttr) {
		 * 
		 * c001BoardService.register(boardvo);
		 * 
		 * return "board"; }
		 * 
		 */
		/*
		 * @RequestMapping("/list") public void list(Model model) throws Exception {
		 * model.addAttribute("list",c001BoardService.listBoard()); }
		 * 
		 * @RequestMapping(value="/create", method
		 * ={RequestMethod.GET,RequestMethod.POST}) public String create(C001BoardVO
		 * boardvo, RedirectAttributes rttr)throws Exception{
		 * System.out.println("create post방식"); System.out.println(boardvo.toString());
		 * 
		 * c001BoardService.create(boardvo);
		 * rttr.addFlashAttribute("result",boardvo.getBno());
		 * 
		 * return"redirect:/create"; }
		 * 
		 * @RequestMapping(value="/read",method ={RequestMethod.GET,RequestMethod.POST})
		 * public void read(@RequestParam("bno")Long bno,Model model) throws Exception {
		 * 
		 * model.addAttribute("board",c001BoardService.read(bno)); }
		 * 
		 * @RequestMapping(value="/update",method=
		 * {RequestMethod.GET,RequestMethod.POST}) public String update(C001BoardVO
		 * boardvo,RedirectAttributes rttr)throws Exception{
		 * 
		 * if(c001BoardService.update(boardvo)) {
		 * rttr.addFlashAttribute("result","sucess"); }
		 * 
		 * return"redirect:/list"; }
		 * 
		 * @RequestMapping(value ="/delete",method
		 * ={RequestMethod.GET,RequestMethod.POST}) public String
		 * delete(@RequestParam("bno")Long bno,RedirectAttributes rttr)throws Exception{
		 * 
		 * if(c001BoardService.delete(bno)) { rttr.addFlashAttribute("result","sucess");
		 * }
		 * 
		 * return "redirect:/list"; }
		 * 
		 */

		

}
